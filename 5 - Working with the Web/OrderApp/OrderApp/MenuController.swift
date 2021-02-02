//
//  MenuController.swift
//  OrderApp
//
//  Created by Volodymyr Ostapyshyn on 24.01.2021.
//

import UIKit

class MenuController {
    typealias MinutesToPrepare = Int
    let baseURL = URL(string: "http://localhost:8080/")!
    
    var userActivity = NSUserActivity(activityType:
       "com.example.OrderApp.order")
    
    var order = Order() {
        didSet {
            NotificationCenter.default.post(name:
               MenuController.orderUpdatedNotification, object: nil)
            userActivity.order = order

        }
    }
    
    static let orderUpdatedNotification = Notification.Name("MenuController.orderUpdated")
    
    static let shared = MenuController()
    
    func fetchCategories(completion: @escaping (Result<[String], Error>) -> Void) {
        let categoriesURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoriesURL) { (data, response, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let categoriesResponse = try
                        jsonDecoder.decode(CategoriesResponse.self, from: data)
                    completion(.success(categoriesResponse.categories))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func updateUserActivity(with controller: StateRestorationController) {
        switch controller {
        case .menu(let category):
            userActivity.menuCategory = category
        case .menuItemDetail(let menuItem):
            userActivity.menuItem = menuItem
        case .order, .categories:
            break
        }
        userActivity.controllerIdentifier = controller.identifier
    }
    
    
    func fetchMenuItems(forCategory categoryName: String,
                        completion: @escaping (Result<[MenuItem], Error>) -> Void) {
        let baseMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: baseMenuURL,
                                       resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category",
                                              value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL) { (data, response, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let menuResponse = try
                        jsonDecoder.decode(MenuResponse.self, from: data)
                    completion(.success(menuResponse.items))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func submitOrder(forMenuIDs menuIDs: [MinutesToPrepare], completion:
                        @escaping (Result<Int, Error>) -> Void) {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = ["menuIds": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let orderResponse = try
                        jsonDecoder.decode(OrderResponse.self, from: data)
                    completion(.success(orderResponse.prepTime))
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?)
       -> Void) {
        let task = URLSession.shared.dataTask(with: url)
           { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                print("no IMAGE!")
                completion(nil)
            }
        }
        task.resume()
    }
    
    
    
    
}

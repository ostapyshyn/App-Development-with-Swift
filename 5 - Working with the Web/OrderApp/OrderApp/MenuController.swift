//
//  MenuController.swift
//  OrderApp
//
//  Created by Volodymyr Ostapyshyn on 24.01.2021.
//

import Foundation

class MenuController {
    typealias MinutesToPrepare = Int
    let baseURL = URL(string: "http://localhost:8080/")!
    
    func fetchCategories(completion: @escaping (Result<[String],
       Error>) -> Void) {
        let categoriesURL = baseURL.appendingPathComponent("categories")
    }
    
    func fetchMenuItems(forCategory categoryName: String,
       completion: @escaping (Result<[MenuItem], Error>) -> Void) {
        let baseMenuURL = baseURL.appendingPathComponent("menu")
            var components = URLComponents(url: baseMenuURL,
               resolvingAgainstBaseURL: true)!
            components.queryItems = [URLQueryItem(name: "category",
               value: categoryName)]
            let menuURL = components.url!
    }
    
    func submitOrder(forMenuIDs menuIDs: [MinutesToPrepare], completion:
       @escaping (Result<Int, Error>) -> Void) {
        let orderURL = baseURL.appendingPathComponent("order")
    }
    
}

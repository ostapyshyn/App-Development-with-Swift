//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Volodymyr Ostapyshyn on 20.01.2021.
//

import UIKit

class PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (Result<PhotoInfo, Error>) -> Void) {
        var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        urlComponents.queryItems = [
            "api_key": "DEMO_KEY",
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
                    completion(.success(photoInfo))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

import UIKit
import PlaygroundSupport

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?

    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

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

fetchPhotoInfo { (result) in
    switch result {
    case .success(let photoInfo):
        print("Successfully fetched PhotoInfo: \(photoInfo)")
    case .failure(let error):
        print("Fetch PhotoInfo Failed with Error: \(error)")
    }

    PlaygroundPage.current.finishExecution()
}




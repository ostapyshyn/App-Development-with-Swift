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

var urlComponents = URLComponents(string:
   "https://api.nasa.gov/planetary/apod")!
urlComponents.queryItems = [
    "api_key": "DEMO_KEY",
    "date": "2013-07-16"
].map { URLQueryItem(name: $0.key, value: $0.value) }

let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!
let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
    let jsonDecoder = JSONDecoder()
    if let data = data,
        let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
        print(photoInfo)
    }
    PlaygroundPage.current.finishExecution()
}

task.resume()


import UIKit
import PlaygroundSupport

protocol APIRequest {
    associatedtype Response

    var urlRequest: URLRequest { get }
    func decodeResponse(data: Data) throws -> Response
}


func sendRequest<Request>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) where Request: APIRequest {
    
}

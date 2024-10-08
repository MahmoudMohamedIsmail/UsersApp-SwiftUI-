
import Foundation

protocol URLRequestGeneratorProtocol {
    func generateURLRequest(with config: NetworkConfigurable, from request: NetworkRequestProtocol) throws -> URLRequest
}

final class URLRequestGenerator: URLRequestGeneratorProtocol {
    
    func generateURLRequest(with config: NetworkConfigurable, from request: NetworkRequestProtocol) throws -> URLRequest {
        let url = try createURL(with: config, from: request)
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.httpMethod = request.method.rawValue
        if !request.bodyParameters.isEmpty {
            do {
                let bodyData = try JSONSerialization.data(withJSONObject: request.bodyParameters,
                                                           options: [.prettyPrinted])
                urlRequest.httpBody = bodyData
            } catch {
                throw error
            }
        }
        config.headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        return urlRequest
    }
    
    private func createURL(with config: NetworkConfigurable, from request: NetworkRequestProtocol) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = config.baseURL
        components.path = request.path
        components.queryItems = request.queryParameters.map { URLQueryItem(name: $0, value: "\($1)") }
        guard let url = components.url else { throw NetworkError.badURL }
        return url
    }
}

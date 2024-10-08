
import Foundation

protocol APIDataServiceProtocol {
    func request<T: Decodable>(request: NetworkRequestProtocol) async throws -> T
}

final class APIDataService: APIDataServiceProtocol {
    
    private let config: NetworkConfigurable
    private let session: URLSessionProtocol
    private let requestGenerator: URLRequestGeneratorProtocol
    
    init(config: NetworkConfigurable = NetworkConfiguration(baseURL: "jsonplaceholder.typicode.com"),
         session: URLSessionProtocol = URLSession.shared,
         requestGenerator: URLRequestGeneratorProtocol = URLRequestGenerator()) {
        self.config = config
        self.session = session
        self.requestGenerator = requestGenerator
    }
    
    func request<T>(request: NetworkRequestProtocol) async throws -> T where T : Decodable {
        let urlRequest = try requestGenerator.generateURLRequest(with: config, from: request)
        let (data, response) = try await session.asyncData(for: urlRequest)
        guard let response = response as? HTTPURLResponse else { throw NetworkError.noResponse }
        if response.statusCode != 200 { throw NetworkError.failed }
        guard let data = data else { throw NetworkError.noData }
        return try decode(data: data)
    }
    
    
    private func decode<T>(data: Data) throws -> T where T : Decodable {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.unableToDecode
        }
    }
}

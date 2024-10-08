
import Foundation

enum NetworkError: Error {
    case badURL
    case badHostname
    case failed
    case noResponse
    case noData
    case unableToDecode
    case notConnected
    case generic
    
    var description: String {
        switch self {
        case .badURL: return "Bad URL"
        case .badHostname: return "A server with the specified hostname could not be found"
        case .failed: return "Network Request Failed"
        case .noResponse: return "No response"
        case .noData: return "No Data"
        case .unableToDecode: return "Response can't be decoded"
        case .notConnected: return "The internet connection appears to be offline"
        case .generic: return "Something went wrong"
        }
    }
}

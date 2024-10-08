//
//  UserListService.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

protocol UserListServiceProtocol {
    func fetchUsers() async throws -> [UserResponse]
}

final class UserListService: UserListServiceProtocol {
    
    private let path: String = "/users"
    private let service: APIDataServiceProtocol
    
    init(service: APIDataServiceProtocol = APIDataService()) {
        self.service = service
    }
    
    func fetchUsers() async throws -> [UserResponse] {
        let networkRequest = NetworkRequest(path: path, method: .get)
        return try await service.request(request: networkRequest)
    }
}

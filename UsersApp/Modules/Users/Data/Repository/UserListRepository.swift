//
//  UserListRepository.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

final class UserListRepository: UserListRepositoryProtocol {
    
    private let service: UserListServiceProtocol
    
    init(service: UserListServiceProtocol = UserListService()) {
        self.service = service
    }
    
    func fetchUsers() async throws -> [User] {
        try await service.fetchUsers().map { User(userResponse: $0) }
    }
}

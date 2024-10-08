//
//  UserListUseCase.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

protocol UserListUseCaseProtocol {
    func fetchUsers() async throws -> [User]
}

final class UserListUseCase: UserListUseCaseProtocol {
    
    private let repository: UserListRepositoryProtocol
    
    init(repository: UserListRepositoryProtocol = UserListRepository()) {
        self.repository = repository
    }
    
    func fetchUsers() async throws -> [User] {
        try await repository.fetchUsers()
    }
}

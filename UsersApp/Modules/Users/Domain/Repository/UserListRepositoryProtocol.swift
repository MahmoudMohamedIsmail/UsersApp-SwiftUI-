//
//  UserListRepositoryProtocol.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

protocol UserListRepositoryProtocol {
    func fetchUsers() async throws -> [User]
}

//
//  UserListViewModel.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

protocol UserListViewModelProtocol: BaseViewModel {
    var users: [User] {get set}
    var title: String {get}
    
    func fetchUsers() async
}

final class UserListViewModel: UserListViewModelProtocol {
    
    @Published var users: [User] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool {
        return users.isEmpty
    }
    
    var title: String = "Users"
    private let useCase: UserListUseCaseProtocol
    
    init(useCase: UserListUseCaseProtocol = UserListUseCase()) {
        self.useCase = useCase
    }
    
    /// This method fetches products and catches error if any
    @MainActor func fetchUsers() async {
        do {
            users = try await useCase.fetchUsers()
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    
}

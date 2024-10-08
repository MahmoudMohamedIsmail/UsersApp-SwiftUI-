//
//  FavoritesUsers.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

@Observable
class FavoritesUsers {
    
    private var favoritesUsersId: Set<Int>
    private var localFavorites: LocalFavoritesProtocol
    private let key = "FavoritesUsrs"

    init(localFavorites: LocalFavoritesProtocol = LocalFavorites.shared) {
        self.localFavorites = localFavorites
        favoritesUsersId = Set(localFavorites.retriveUsersIds())
    }

    @MainActor func contains(_ user: User) -> Bool {
        guard let id = user.id else { return false }
        return favoritesUsersId.contains(id)
    }

    @MainActor func add(_ user: User) {
        guard let id = user.id else { return }
        favoritesUsersId.insert(id)
        localFavorites.addUser(id: id)
    }

    @MainActor func remove(_ user: User) {
        guard let id = user.id else { return }
        favoritesUsersId.remove(id)
        localFavorites.removeUser(id: id)
    }
}

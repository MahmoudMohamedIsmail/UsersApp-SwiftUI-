//
//  UsersAppApp.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import SwiftUI

@main
struct UsersAppApp: App {
    @State private var favorites = FavoritesUsers()

    var body: some Scene {
        WindowGroup {
            UserListView(viewModel: UserListViewModel())
                .environment(favorites)
        }
    }
}

//
//  FavoriteUserIcon.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import SwiftUI

struct FavoriteUserIcon: View {
    
    @Environment(FavoritesUsers.self) var favorites
    var user: User
    
    private let unFavoriteIcon: String = "favorite-icon"
    private let favoriteIcon: String = "favorite-fill-icon"
    
    var body: some View {
        if favorites.contains(user) {
            Button(action: { favorites.remove(user) }) {
                Image(favoriteIcon)
            }
        } else {
            Button(action: { favorites.add(user) }) {
                Image(unFavoriteIcon)
            }
        }
    }
}

#Preview {
    FavoriteUserIcon(user: .init(id: 0, name: "Mahmoud Ismail", username: "ismail.c", email: "mahmoud.ismail2203@gmail.com", address: "Cairo, Egypt", phone: "+201127172502", website: "mahmoudismail.com", company: "Company"))
        .environment(FavoritesUsers())
}

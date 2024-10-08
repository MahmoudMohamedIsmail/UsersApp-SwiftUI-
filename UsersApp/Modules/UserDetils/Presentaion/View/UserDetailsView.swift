//
//  UserDetailsView.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import SwiftUI

struct UserDetailsView: View {
    
    @Environment(FavoritesUsers.self) var favorites
    var user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack {
                    UserImageView()
                        .frame(width: 100, height: 100)
                        .clipShape(.circle)
                    
                    Text("\(user.name ?? "")")
                        .applyPrimaryTitleStyle()
                }
                VStack {
                    userDetails
                        .padding(16)
                        .background(.mainBackground)
                }
            }
        }
        .background(.mainBackground)
        .toolbar {
            favoriteButton
        }
        
    }
    
    private var favoriteButton: some View {
        Button {
            if favorites.contains(user) {
                   favorites.remove(user)
               } else {
                   favorites.add(user)
               }
        } label: {
            FavoriteUserIcon(user: user)
                .frame(width: 24, height: 24)
        }
    }
    
    private var userDetails: some View {
        VStack(spacing: 16) {
            createUserItemView(title: "Email", subtitle: user.email ?? "", systemIcon: "envelope.circle")
            createUserItemView(title: "Phone", subtitle: user.phone ?? "", systemIcon: "phone.circle")
            createUserItemView(title: "Address", subtitle: user.address ?? "", systemIcon: "house.circle")
        }
      
    }
    
    private func createUserItemView(title: String, subtitle: String, systemIcon: String) -> some View {
        HStack {
            Image(systemName: systemIcon)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.main)
            
            Text(title)
                .applyPrimaryTitleStyle()
            Spacer()
            
            Text(subtitle)
                .applySecondaryTitleStyle()
        }
        .padding(16)
        .background(.white)
        .clipShape(.rect(cornerRadius: 8))
    }
    
}

#Preview {
    UserDetailsView(user: .init(id: 0, name: "Mahmoud Ismail", username: "ismail.c", email: "mahmoud.ismail3@gmail.com", address: "Cairo, Egypt", phone: "+201127172502", website: "mahmoudismail.com", company: "Company"))
        .environment(FavoritesUsers())
}

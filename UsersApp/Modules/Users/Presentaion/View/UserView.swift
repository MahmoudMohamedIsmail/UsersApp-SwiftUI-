//
//  UserView.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import SwiftUI

struct UserView: View {
    
    @Environment(FavoritesUsers.self) var favorites
    var user: User
        
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            UserImageView()
                .clipShape(.rect(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(user.name ?? "")")
                        .applyPrimaryTitleStyle()
                  
                    Spacer()
                    FavoriteUserIcon(user: user)
                        .frame(width: 24, height: 24)
                }
                
                Text("\(user.username ?? "")")
                    .applySecondaryTitleStyle()
                
                Text("\(user.address ?? "")")
                    .applySecondaryTitleStyle()
            }
            
        }
        .frame(height: 80)
        .padding(12)
        .background(.white)
        .cornerRadius(12)
       
    }
}

#Preview {
    UserView(user: .init(id: 0, name: "Mahmoud Ismail", username: "ismail.c", email: "mahmoud.ismail2203@gmail.com", address: "Cairo, Egypt", phone: "+201127172502", website: "mahmoudismail.com", company: "Company"))
        .environment(FavoritesUsers())
}


//
//  UserImageView.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import SwiftUI

struct UserImageView: View {
    var body: some View {
        Image("user-icon")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(.mainBackground)
    }
}

#Preview {
    UserImageView()
}

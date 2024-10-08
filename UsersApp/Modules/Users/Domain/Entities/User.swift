//
//  User.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

struct User: Identifiable {
    let id: Int?
    let name, username, email: String?
    let address: String?
    let phone, website: String?
    let company: String?
    
}

extension User {
    
    init(userResponse: UserResponse) {
        self.id = userResponse.id
        self.name = userResponse.name
        self.username = userResponse.username
        self.email = userResponse.email
        self.address = "\(userResponse.address?.street ?? ""), \(userResponse.address?.city ?? "")"
        self.phone = userResponse.phone
        self.website = userResponse.website
        self.company = userResponse.company?.name
    }
}

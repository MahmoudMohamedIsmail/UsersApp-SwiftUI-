//
//  User.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

// MARK: - User
struct UserResponse: Codable {
    let id: Int?
    let name, username, email: String?
    let address: UserAddress?
    let phone, website: String?
    let company: UserCompany?
}

// MARK: - Address
struct UserAddress: Codable {
    let street, suite, city, zipcode: String?
    let geo: UsreLocation?
}

// MARK: - Geo
struct UsreLocation: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct UserCompany: Codable {
    let name, catchPhrase, bs: String?
}

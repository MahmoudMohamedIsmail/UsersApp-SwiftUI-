//
//  BaseViewModel.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import Foundation

protocol BaseViewModel: ObservableObject {
    var isError: Bool {get}
    var error: String {get}
    var isEmpty: Bool {get}

    func shouldShowLoader() -> Bool
}

extension BaseViewModel {
    func shouldShowLoader() -> Bool {
        return (isEmpty && !isError)
    }
}

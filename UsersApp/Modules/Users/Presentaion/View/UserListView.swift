//
//  UserListView.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import SwiftUI

struct UserListView<ViewModel>: View where ViewModel: UserListViewModelProtocol {
    
    @Environment(FavoritesUsers.self) var favorites
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.users) { user in
                            NavigationLink(destination: UserDetailsView(user: user)) {
                                UserView(user: user)
                            }
                        }
                    }
                    .padding(16)
                }
                .background(.mainBackground)
                .navigationTitle("Users")
            }
        }
        .tint(.main)
        .task {
            await viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel())
        .environment(FavoritesUsers())
}

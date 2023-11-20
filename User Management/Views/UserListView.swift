//
//  UserListView.swift
//  User Management
//
//  Created by Nikhil kumar on 11/11/23.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var isPresentingNewUserView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.users) { user in
                        NavigationLink(destination: EditUserView(user: user)) {
                            UserListItemView(user: user)
                        }
                    }
                    .onDelete { indexSet in
                        guard let index = indexSet.first else { return }
                        viewModel.delete(userId: viewModel.users[index].id)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("List of Users")
            .toolbar {
                NavigationLink(destination: NewUserProfileView()) {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}


        


struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}

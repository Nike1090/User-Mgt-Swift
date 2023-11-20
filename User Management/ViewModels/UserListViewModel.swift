//
//  UserListViewModel.swift
//  User Management
//
//  Created by Nikhil kumar on 11/11/23.
//

import Foundation


class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var showingNewUserView: Bool = false
    
    func fetchUsers() {
            do {
                let retrievedUsers =  DatabaseManagaer.shared.retrieveUsers()
                self.users = retrievedUsers
            }
        }
    
    func delete(userId: Int) {
        if let index = users.firstIndex(where: { $0.id == userId }) {
            users.remove(at: index)
            DatabaseManagaer.shared.deleteUser(userId: userId)
        }
    }
    
    
    func showNewUserView() {
            showingNewUserView = true
        }

       
    
}

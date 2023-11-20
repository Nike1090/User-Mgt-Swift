//
//  UserListItemViewModel.swift
//  User Management
//
//  Created by Karicharla sricharan on 11/13/23.
//

import Foundation

class UserListItemViewModel: ObservableObject {
    @Published var showingEditUserView: Bool = false
    
    func showEditUserView() {
            showingEditUserView = true
        }

}

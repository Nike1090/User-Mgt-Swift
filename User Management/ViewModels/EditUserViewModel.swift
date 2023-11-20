//
//  EditUserViewModel.swift
//  User Management
//
//  Created by Nikhil kumar on 11/13/23.
//

import Foundation

class EditUserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func EditUser(userId: String, firstName: String, lastName: String, email: String, phoneNumber: String, address: String) {
        // Check if userId is an integer
        guard let userIdInt = Int(userId) else {
            return
        }
        
        // Check if all fields are filled
        if userId.isEmpty || firstName.isEmpty || lastName.isEmpty || email.isEmpty || phoneNumber.isEmpty || address.isEmpty {
            showAlert(message: "Please fill all fields")
            return
        }
        
        // Check if email is in proper format
        if !isValidEmail(email) {
            showAlert(message: "Please provide correct email format")
            return
        }
        
        // Check if phoneNumber is in correct format and is an integer
        guard let phoneNumberInt = Int(phoneNumber), phoneNumber.count == 10 else {
            showAlert(message: "Please provide correct 10-digit phone number")
            return
        }
        
        
        // If all checks pass, add the new user
        DatabaseManagaer.shared.updateUser(userId: userIdInt, firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumberInt, address: address)
        showAlert(message: "User \(firstName) \(lastName) is edited")
        
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func showAlert(message: String) {
        DispatchQueue.main.async {
                    self.alertMessage = message
                    self.showAlert = true
                }
    }
}

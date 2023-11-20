//
//  User.swift
//  User Management
//
//  Created by Nikhil kumar on 11/11/23.
//

import Foundation

struct User: Identifiable {
    var id: Int
    var userId: Int
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: Int
    var address: String
}

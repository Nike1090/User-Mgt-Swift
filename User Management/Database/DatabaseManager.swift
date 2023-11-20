//
//  DatabaseManager.swift
//  User Management
//
//  Created by Nikhil kumar on 11/11/23.
//

import Foundation
import SQLite

class DatabaseManagaer {
    // Singleton Object for Database
    static let shared = DatabaseManagaer()
    var db: Connection?
    
    public init() {
        do {
            // Set the path to the SQLite database file
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let dbPath = URL(fileURLWithPath: path).appendingPathComponent("dataModel.sqlite3").path

            // Create a database connection
            db = try! Connection(dbPath)

            // Create table
            try createTable()

            // Insert data
            insertInitialData()

        } catch {
            print("Error creating database connection: \(error)")
        }
    }

    public func createTable() throws {
        do {
            // Create Users table
            let Users = Table("Users")
            let userId = Expression<Int>("user_Id")
            let firstName = Expression<String>("first_Name")
            let lastName = Expression<String>("last_Name")
            let email = Expression<String>("email")
            let phoneNumber = Expression<Int>("phone_Number")
            let address = Expression<String>("address")

            try db?.run(Users.create(ifNotExists: true) { table in
                table.column(userId, primaryKey: true)
                table.column(firstName)
                table.column(lastName)
                table.column(email)
                table.column(phoneNumber)
                table.column(address)
            })

        } catch {
            // Handle the error here
            print("Error creating User table: \(error)")
            throw error
        }
    }
    
    public func insertInitialData() {
        do{
        // Insert data into Users table
            let Users = Table("Users")
            let insertUser = Users.insert(or: .ignore, [
            Expression<Int>("user_Id") <- 1000,
            Expression<String>("first_Name") <- "Ram",
            Expression<String>("last_Name") <- "Varma",
            Expression<String>("email") <- "ram@varma.edu",
            Expression<Int>("phone_Number") <- 6172343443,
            Expression<String>("address") <- "150 Huntington"
        ])

        try db?.run(insertUser)
    
    } catch {
        // Handle the error here
        print("Error inserting initial data: \(error)")
    }
   }
    
    public func InsertUser(userId: Int,firstName: String,lastName: String,email: String,phoneNumber: Int,address: String) {
        do{
        // Insert data into Users table
            let Users = Table("Users")
            let insertUser = Users.insert(or: .ignore, [
            Expression<Int>("user_Id") <- userId,
            Expression<String>("first_Name") <- firstName,
            Expression<String>("last_Name") <- lastName,
            Expression<String>("email") <- email,
            Expression<Int>("phone_Number") <- phoneNumber,
            Expression<String>("address") <- address
        ])

        try db?.run(insertUser)
    
    } catch {
        // Handle the error here
        print("Error inserting initial data: \(error)")
    }
   }
    
    func isUserIdExists(_ userId: Int) -> Bool {
            do {
                let Users = Table("Users")
                let userIdColumn = Expression<Int>("user_Id")

                let query = Users.filter(userIdColumn == userId)
                let count = try db?.scalar(query.count) ?? 0

                return count > 0
            } catch {
                print("Error checking if userId exists: \(error)")
                return false
            }
        }
    
    func deleteUser(userId: Int) {
            do {
                let Users = Table("Users")
                let userIdColumn = Expression<Int>("user_Id")

                let user = Users.filter(userIdColumn == userId)
                try db?.run(user.delete())
            } catch {
                // Handle the error here
                print("Error deleting user: \(error)")
            }
        }
    
    func updateUser(userId: Int, firstName: String, lastName: String, email: String, phoneNumber: Int, address: String) {
        do {
            let Users = Table("Users")
            let user = Users.filter(Expression<Int>("user_Id") == userId)

            let updateUser = user.update([
                Expression<String>("first_Name") <- firstName,
                Expression<String>("last_Name") <- lastName,
                Expression<String>("email") <- email,
                Expression<Int>("phone_Number") <- phoneNumber,
                Expression<String>("address") <- address
            ])

            try db?.run(updateUser)
        } catch {
            // Handle the error here
            print("Error updating user: \(error)")
        }
    }
    
    
    // function to retrieveUsers
    func retrieveUsers() -> [User] {
            do {
                let usersTable = Table("Users")
                let userId = Expression<Int>("user_Id")
                let firstName = Expression<String>("first_Name")
                let lastName = Expression<String>("last_Name")
                let email = Expression<String>("email")
                let phoneNumber = Expression<Int>("phone_Number")
                let address = Expression<String>("address")
                
                let query = usersTable.select(userId, firstName, lastName, email, phoneNumber, address)
                let userRows = try db?.prepare(query)

                guard let rows = userRows else { return [] }

                return rows.map { row in
                    User(
                        id: row[userId],
                        userId: row[userId],
                        firstName: row[firstName],
                        lastName: row[lastName],
                        email: row[email],
                        phoneNumber: row[phoneNumber],
                        address: row[address]
                    )
                }
            } catch {
                print("Error retrieving users: \(error)")
                return []
            }
        }
    
}


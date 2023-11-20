//
//  UserListItemView.swift
//  User Management
//
//  Created by Nikhil kumar on 11/13/23.
//

import SwiftUI

struct UserListItemView: View {
    let user: User
    
    func formatPhoneNumber(_ phoneNumber: Int) -> String {
            let phoneNumberString = String(phoneNumber)
            
        guard phoneNumberString.count == 10 else {
                return phoneNumberString // Return original string if it's not a 10-digit number
            }
            
            let firstPart = phoneNumberString.prefix(3)
            let secondPart = phoneNumberString.dropFirst(3).prefix(3)
            let thirdPart = phoneNumberString.dropFirst(6)
            
            return "\(firstPart)-\(secondPart)-\(thirdPart)"
        }
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Text("\(user.firstName)").font(.title).bold()
                    Text("\(user.lastName)").font(.title).bold()
                }
                Text("Email: \(user.email)").font(.footnote).foregroundColor(Color(.secondaryLabel))
                
                Text("Mobile: \(formatPhoneNumber(user.phoneNumber))").font(.footnote).foregroundColor(Color(.secondaryLabel))
                               
                Text("Address: \(user.address)").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
        }
    }
}

struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUser = User(
                    id: 1,
                    userId: 1000,
                    firstName: "Abraham",
                    lastName: "Shamil",
                    email: "Abraham.sham@gmail.com",
                    phoneNumber: 1234567890,
                    address: "349 Web St"
                )
                return UserListItemView(user: sampleUser)
    } 
}

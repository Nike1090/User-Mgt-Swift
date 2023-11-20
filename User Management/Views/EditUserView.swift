//
//  EditUserView.swift
//  User Management
//
//  Created by Nikhil kumar on 11/13/23.
//

import SwiftUI

struct EditUserView: View {
    let user: User
    @State var userId = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var address = ""
    @ObservedObject private var viewModel: EditUserViewModel
        
        init(user: User) {
            self.user = user
            self._userId = State(initialValue: "\(user.userId)")
            self._firstName = State(initialValue: user.firstName)
            self._lastName = State(initialValue: user.lastName)
            self._email = State(initialValue: user.email)
            self._phoneNumber = State(initialValue: "\(user.phoneNumber)")
            self._address = State(initialValue: user.address)
            self.viewModel = EditUserViewModel()
        }
        
    var body: some View {
        VStack() {
            Text("Edit User Details").font(.system(size : 30)).bold().padding()
                        
            TextField("\(user.firstName)", text: $firstName)
                            .padding()
                            .border(Color.pink, width: 1)
                        
            TextField("\(user.lastName)", text: $lastName)
                            .padding()
                            .border(Color.pink, width: 1)
                        
            TextField("\(user.email)", text: $email)
                            .padding()
                            .border(Color.pink, width: 1)
            TextField("\(user.phoneNumber)", text: $phoneNumber)
                           .padding()
                           .border(Color.pink, width: 1)
            TextField("\(user.address)", text: $address)
                           .padding()
                           .border(Color.pink, width: 1)
            
                         Button {
                             viewModel.EditUser(userId: userId,firstName: firstName,lastName: lastName,email: email,phoneNumber: phoneNumber,address: address)
                             
                         }label: {
                             ZStack{
                                 RoundedRectangle(cornerRadius: 0).foregroundColor(Color.pink)
                                 Text("Edit User").bold().foregroundColor(Color.white)
                             }.frame(height: 60)
                         }
                    }
                    .padding()
                    .alert(isPresented: $viewModel.showAlert) {
                                Alert(title: Text("Alert"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                            }
        
        
    }
    }


struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUser = User(
                    id: 1,
                    userId: 1000,
                    firstName: "John",
                    lastName: "Doe",
                    email: "john.doe@example.com",
                    phoneNumber: 1234567890,
                    address: "123 Main St"
                )
                return EditUserView(user: sampleUser)
    }
}

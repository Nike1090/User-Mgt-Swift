//
//  NewUserProfileView.swift
//  User Management
//
//  Created by Nikhil kumar on 11/11/23.
//

import SwiftUI

struct NewUserProfileView: View {
    @State var userId = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var address = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    @StateObject var viewModel = NewUserProfileViewModel()
    
    var body: some View {
        VStack() {
            Text("Add New User").font(.system(size : 30)).bold().padding()
                
                        TextField("Enter User Id", text: $userId)
                            .padding()
                            .border(Color.pink, width: 1)
                        
                        TextField("Enter First Name", text: $firstName)
                            .padding()
                            .border(Color.pink, width: 1)
                        
                        TextField("Enter Last Name", text: $lastName)
                            .padding()
                            .border(Color.pink, width: 1)
                        
                         TextField("Enter Email", text: $email)
                            .padding()
                            .border(Color.pink, width: 1)
                         TextField("Enter Phone Number", text: $phoneNumber)
                           .padding()
                           .border(Color.pink, width: 1)
                         TextField("Enter Address", text: $address)
                           .padding()
                           .border(Color.pink, width: 1)
            
                         Button {
                             viewModel.AddNewUser(userId: userId,firstName: firstName,lastName: lastName,email: email,phoneNumber: phoneNumber,address: address)
                               
                             
                         }label: {
                             ZStack{
                                 RoundedRectangle(cornerRadius: 0).foregroundColor(Color.pink)
                                 Text("Add User").bold().foregroundColor(Color.white)
                             }.frame(height: 60)
                         }
                    }
                    .padding()
                    .alert(isPresented: $viewModel.showAlert) {
                                Alert(title: Text("Alert"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                            }
        
    }
}

struct NewUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserProfileView()
    }
}

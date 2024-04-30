//
//  Onboarding.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 28/04/2024.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"


struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @State private var isLoggedIn = false


    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                                EmptyView()
                            }
                TextField(" First Name", text: $firstName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField(" Last Name", text: $lastName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                

                TextField(" Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if(!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        
                    }else {
                        print ("first , last and email is empty")
                    }
                    
                    
                }){
                    Text("Register")
                        .foregroundColor(Color("PrimaryOne"))
                        .padding()
                        .bold()
                        .padding(.trailing, 110)
                        .padding(.leading, 110)
                        
                                        .background(Color("AccentColor"))
                                        .cornerRadius(10)
                }
            }
        }.onAppear(){
            if (UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    Onboarding()
}

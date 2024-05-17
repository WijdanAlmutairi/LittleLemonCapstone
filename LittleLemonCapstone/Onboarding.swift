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

enum FocusableField: Hashable {
    case firstName, lastName, email
}

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @State private var isLoggedIn = false
    
    @FocusState private var focusedField: FocusableField?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("Logo")
                    Spacer()
                    HeroSection()
                        .padding(.bottom, 20)
                    NavigationLink(destination: Home(), isActive: $isLoggedIn){
                        EmptyView()
                    }
                    VStack {
                        Text("First Name*")
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        
                        TextField(" First Name", text: $firstName)
                            .focused($focusedField, equals: .firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(10)
                    
                    VStack {
                        Text("Last Name*")
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        
                        TextField(" Last Name", text: $lastName)
                            .keyboardType(.emailAddress)
                            .focused($focusedField, equals: .lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(10)
                    
                    
                    VStack {
                        Text("Email*")
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        
                        TextField(" Email", text: $email)
                            .focused($focusedField, equals: .email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(10)
                    Spacer()
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
                            .foregroundColor(Color("AccentColor"))
                            .padding()
                            .bold()
                            .padding(.trailing, 110)
                            .padding(.leading, 110)
                        
                            .background(Color("PrimaryOne"))
                            .cornerRadius(10)
                    }.padding(.top, 30)
                    Spacer()
                }
            }
            
        }.onAppear(){
            if (UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                isLoggedIn = true
            }
            focusedField = .firstName
        }
    }
}

#Preview {
    Onboarding()
}

//
//  UserProfile.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 30/04/2024.
//

import SwiftUI

struct UserProfile: View {
    // user defaults
    @AppStorage(kFirstName) var firstName = ""
    @AppStorage(kLastName) var lastName = ""
    @AppStorage(kEmail) var email = ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Text("Personal information")
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text("First Name")
                    .foregroundColor(.gray)
                    .bold()
                TextField(" First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(true)
                Text("Last Name")
                    .foregroundColor(.gray)
                    .bold()
                TextField(" Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(true)
                
                Text("Email")
                    .foregroundColor(.gray)
                    .bold()
                TextField(" Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(true)
            }.padding()
            Spacer()
            Button(action: {
                @AppStorage(kIsLoggedIn) var firstName = false
                self.presentation.wrappedValue.dismiss()
            }){
                Text("Logout")
                    .foregroundColor(Color("AccentColor"))
                    .padding()
                    .bold()
                    .padding(.trailing, 110)
                    .padding(.leading, 110)
                
                    .background(Color("PrimaryOne"))
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}

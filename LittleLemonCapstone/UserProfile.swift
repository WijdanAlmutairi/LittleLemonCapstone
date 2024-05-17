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
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 1)
            VStack{
                Spacer()
                
                Text("Personal information")
                    .bold()
                    .padding()
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text("Avatar")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.leading)
                    .frame(maxWidth:.infinity,alignment: .leading)
                HStack {
                    Image("ProfileImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .padding(.leading)
                    Button(action: {
                        print("Button Pressed")
                    }){
                        Text("Change")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("AccentColor"))
                            .cornerRadius(10)
                    }
                    Button(action: {
                        print("Button Pressed")
                    }){
                        Text("Remove")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding()
                            .background(.white)
                            .border(Color("AccentColor"))
                    }
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
        }.padding(10)
    }
}

#Preview {
    UserProfile()
}

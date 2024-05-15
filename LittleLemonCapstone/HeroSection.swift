//
//  HeroSection.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 14/05/2024.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            
                Text("Little Lemon")
                .font(.largeTitle)
                .foregroundColor(.primaryOne)
            
                Text("Chicago")
                .font(.title2)
                .foregroundColor(.white)
            
            HStack {
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(.callout)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                Image("HeroImage")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(15)
        .padding(.bottom, 50)
        .background(Color("AccentColor"))
        
    }
}

#Preview {
    HeroSection()
}

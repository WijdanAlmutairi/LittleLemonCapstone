//
//  Home.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 30/04/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Text("Home")
                .font(.title)
                .tabItem ({
                    Label("Home", systemImage: "house")
                })
            Menu()
                .font(.title)
                .tabItem ({
                    Label("Menu", systemImage: "list.dash")
                })
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}

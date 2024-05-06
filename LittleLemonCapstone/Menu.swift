//
//  Menu.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 30/04/2024.
//

import SwiftUI


struct Menu: View {
    func getMenuData () {
        let url = URL (string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let urlRequest = URLRequest(url: url)
                                    
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let fullMenu = try decoder.decode(MenuList.self, from: data)
                print(fullMenu)
                print("here")
                
            } catch{
                print("Error decoding JSON: \(error)")
            }
            
        }
        
        task.resume()

    }
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant,focused on traditional recipes served with a modern twist. ")
            
            List {
                
            }
        }.onAppear() {
            getMenuData()
        }
    }
}

#Preview {
    Menu()
}

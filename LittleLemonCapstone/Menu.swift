//
//  Menu.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 30/04/2024.
//

import SwiftUI
import CoreData


struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest( sortDescriptors: [NSSortDescriptor(keyPath: \Dish.title, ascending: true)],animation: .default)
               
        private var dishs: FetchedResults<Dish>
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
                
                // Convert the menuItem to dish
                for item in fullMenu.menu {
                    let dish = Dish(context: viewContext)
                    dish.id = Int64(item.id)
                    dish.title = item.title
                    dish.dishDescription = item.description
                    dish.price = item.price
                    dish.image = item.image
                    dish.category = item.category
                    
                    do{
                        try viewContext.save()
                        print("Item saved successfully")
                    } catch{
                        print("Error saving item \(error)")
                    }
                }
                
                
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

            FetchedObjects(predicate: NSPredicate(value: true), sortDescriptors: []) { (dishes: [Dish]) in
                List {
                    ForEach (dishes) { dish in
                        NavigationLink(destination:DishDetails(dish: dish)) {
                            HStack {
                                Text(dish.title ?? "title")
                                Spacer()
                                Text(dish.price ?? "price")
                                    .font(.callout)
                            }
                        }
                    }
                    
                }
            }
            
        }.onAppear() {
            getMenuData()
        }
    }
}

#Preview {
    Menu()
}

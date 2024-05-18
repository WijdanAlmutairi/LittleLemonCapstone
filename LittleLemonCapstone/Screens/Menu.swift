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
    @State var searchText = ""
    @State var categoryText = ""
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
            HStack {
                Image("Logo")
                    .padding()
                Image("ProfileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            HeroSection()
                .overlay {
                    TextField("Search", text: $searchText)
                        .padding()
                        .padding(.top, 190)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            
            Text("ORDER FOR DELIVERY!")
                .bold()
                .padding(10)
                .frame(maxWidth:.infinity,alignment: .leading)
            HStack {
                // Button 1
                Button(action: {
                    categoryText = "starters"
                }){
                    Text("Starters")
                        .foregroundColor(Color("AccentColor"))
                        .font(.callout)
                        .padding(15)
                        .bold()
                        .background(Color("SecondryThree"))
                        .cornerRadius(20)
                }
                
                // Button 2
                Button(action: {
                    categoryText = "mains"
                }){
                    Text("Mains")
                        .foregroundColor(Color("AccentColor"))
                        .font(.callout)
                        .padding(15)
                        .bold()
                        .background(Color("SecondryThree"))
                        .cornerRadius(20)
                }
                
                // Button 3
                Button(action: {
                    categoryText = "desserts"
                }){
                    Text("Desserts")
                        .foregroundColor(Color("AccentColor"))
                        .font(.callout)
                        .padding(15)
                        .bold()
                        .background(Color("SecondryThree"))
                        .cornerRadius(20)
                }
                
                // Button 4
                Button(action: {
                    categoryText = "drinks"
                }){
                    Text("Drinks")
                        .foregroundColor(Color("AccentColor"))
                        .font(.callout)
                        .padding(15)
                        .bold()
                        .background(Color("SecondryThree"))
                        .cornerRadius(20)
                }
                
            }.padding(5)
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach (dishes) { dish in
                        NavigationLink(destination:DishDetails(dish: dish)) {
                            VStack {
                                Text(dish.title ?? "title")
                                    .bold()
                                    .frame(maxWidth:.infinity,alignment: .leading)
                                    
                                HStack {
                                    Text(dish.dishDescription ?? "description")
                                        .font(.callout)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    AsyncImage(url: URL(string: dish.image ?? "imageURL")) { image in
                                        image.resizable()
                                        
                                    }placeholder: {
                                        Color.red
                                    }
                                    .frame(width: 90, height: 90)
                                    
                                }
                                Text("$" + (dish.price ?? "price"))
                                    .bold()
                                    .foregroundColor(.accentColor)
                                    .frame(maxWidth:.infinity,alignment: .leading)
                            }
                        }
                    }
                    
                }.listStyle(.plain)
            }
            
        }.onAppear() {
            getMenuData()
        }
    }
    func buildPredicate() -> NSPredicate {
        if (!searchText.isEmpty){
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        else if (!categoryText.isEmpty){
            return NSPredicate(format: "category CONTAINS[cd] %@", categoryText)
        }
        
        return NSPredicate(value: true)
    }
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title",
                             ascending: true,
                             selector: #selector(NSString .localizedStandardCompare))
        ]
    }
}

#Preview {
    Menu()
}

//
//  DishDetails.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 12/05/2024.
//

import SwiftUI

struct DishDetails: View {
    @ObservedObject var dish:Dish
    
    let imageURL = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true"
    var body: some View {
        VStack {
            // Dish
            AsyncImage(url: URL(string: dish.image ?? imageURL)) { image in
                image.resizable()
            }placeholder: {
                Color.red
            }
            .frame(width: UIScreen.main.bounds.width, height: 400)
            Text(dish.title ?? "Bruschetta")
                .font(.title)
                .padding()
            Text(dish.dishDescription ?? "Oven-baked bruschetta stuffed with tomatos and herbs.")
                .padding(.leading)
                .foregroundColor(.gray)
            
                
            Spacer()
            
                Button(action: {
                    print("Button Pressed")
                }){
                    Text("Add for \(dish.price ?? "10")$")
                        .foregroundColor(Color("PrimaryOne"))
                        .bold()
                        .padding(10)
                        .frame(width:UIScreen.main.bounds.width-60)
                        
            }.buttonStyle(.borderedProminent)
           

            Spacer()
                
        }
    }
}

//#Preview {
//    DishDetails(dish: <#Dish#>)
//}

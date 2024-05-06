//
//  MenuItem.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 06/05/2024.
//

import Foundation

struct MenuItem: Codable {
    
    let id: Int64
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}

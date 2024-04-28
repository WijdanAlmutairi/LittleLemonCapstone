//
//  LittleLemonCapstoneApp.swift
//  LittleLemonCapstone
//
//  Created by Wijdan Almutairi on 28/04/2024.
//

import SwiftUI

@main
struct LittleLemonCapstoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
}

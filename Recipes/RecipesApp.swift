//
//  RecipesApp.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI

@main
struct RecipesApp: App {
    
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Menubar()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }

    }
}

//
//  RecipesModel.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import Foundation
import CoreData


class RecipesModel: ObservableObject {
    //protocol inherrited
    
    @Published var newRecipe = Recipes()

    init() {
        let context = PersistenceController.shared.container.viewContext
        let request = NSFetchRequest<Recipes>(entityName: "Recipes")
        if let recipe = try? context.fetch(request).first {
            self.newRecipe = recipe
        } else {
            self.newRecipe = Recipes(context: context)
            try? context.save()
        }
    }
}


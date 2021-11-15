//
//  RecipesModel.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import Foundation

class RecipesModel: ObservableObject {
    //protocol inherrited
    
    @Published var newRecipesModel = NewRecipesModel()
}

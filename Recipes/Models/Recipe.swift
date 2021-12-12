//
//  Recipe.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 5.11.2021.
//

import Foundation
import SwiftUI

struct Recipe: Hashable {
    var title: String
    var methood: String
    var image: String
    var dishType: String?
    var ingredients: [Ingredient]
    var webRecipe = false
    var url = ""
    
    init(recipe: RecipeApi) {
        self.title = recipe.label
        methood = ""
        image = recipe.image
        dishType = recipe.dishType[0]
        ingredients = recipe.ingredients
        webRecipe = true
        url = recipe.url
    }
    
    init(title: String, methood: String, image: String, dishType: String) {
        self.title = title
        self.methood = methood
        self.image = image
        self.dishType = dishType
        self.ingredients = []
    }
    
    static var example = Recipe(title: "test", methood: "test", image: "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg", dishType: "soup")
}

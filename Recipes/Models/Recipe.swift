//
//  Recipe.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 5.11.2021.
//

import Foundation
import SwiftUI

struct Recipe: Decodable, Hashable {
    var title: String
    var methood: String
    var image: String
    
    init(recipe: RecipeApi) {
        self.title = recipe.label
        methood = ""
        image = recipe.image
    }
    
    init(title: String, methood: String, image: String) {
        self.title = title
        self.methood = methood
        self.image = image
    }
    
    static var example = Recipe(title: "test", methood: "test", image: "image")
}

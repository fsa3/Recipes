//
//  Ingredient.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 10.12.2021.
//

import Foundation

struct Ingredient: Codable, Hashable {
    var text: String
    var image: String?
}

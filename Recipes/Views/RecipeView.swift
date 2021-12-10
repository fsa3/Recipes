//
//  RecipeView.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 10.12.2021.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    let recipe: Recipe
    var body: some View {
        VStack {
            Text(recipe.title)
                .font(.largeTitle)
                .bold()
            KFImage(URL(string: recipe.image)!)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.example)
    }
}

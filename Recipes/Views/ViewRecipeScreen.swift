//
//  ViewRecipeScreen.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI

struct RecipesView: View {
    
    @ObservedObject var recipesViewModel: RecipesModel
    
    var body: some View {
        VStack {
            Text("Last added recipe")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
            Spacer()
            VStack {
                Text("First name: \(recipesViewModel.newRecipe.title ?? "")")
                    .padding()
                Text("Last name: \(recipesViewModel.newRecipe.method ?? "")")
                    .padding()
                Text("Town name: \(recipesViewModel.newRecipe.ingredients ?? "")")
                    .padding()
            }
            Spacer()
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

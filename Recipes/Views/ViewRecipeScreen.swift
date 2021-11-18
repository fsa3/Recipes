//
//  ViewRecipeScreen.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI


struct RecipesView: View {
   // var recipe: Recipes
    
    @ObservedObject var recipesViewModel: RecipesModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.title, ascending: true)],
        animation: .default)
    
    private var recipes: FetchedResults<Recipes>
    
    
    var body: some View {
        VStack {
            Text("Last added recipe")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
            Spacer()
            VStack {
                Text("Title: \(recipesViewModel.newRecipe.title ?? "")")
                    .padding()
                Text("Method: \(recipesViewModel.newRecipe.method ?? "")")
                    .padding()
                Text("Ingredients: \(recipesViewModel.newRecipe.ingredients ?? "")")
                    .padding()
            }
            Spacer()
            //split View to make it easier to call recipes
           List {
                ForEach(recipes){ recipe in
                    RecipesView(recipesViewModel: RecipesModel())
                }
           }
        }
        
    }
}



struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

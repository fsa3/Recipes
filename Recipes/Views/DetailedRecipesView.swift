//
//  ListView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 13.12.21.
//

import SwiftUI

struct DetailedRecipesView: View {
    
    @ObservedObject var recipesViewModel: RecipesModel
    
  /*  @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.title, ascending: true)],
        animation: .default)*/
    
   // private var recipes: FetchedResults<Recipes>
    
    let recipes : Recipes
    
    var body: some View {

        VStack {
            Spacer()
            VStack {
                Text("Title: \(recipes.title ?? "")")
                     .padding()
                Text("Title: \(recipes.ingredients ?? "")")
                     .padding()
                Text("Title: \(recipes.method ?? "")")
                     .padding()
                
                
                Text("Title: \(recipesViewModel.newRecipe.title ?? "")")
                    .padding()
                Text("Method: \(recipesViewModel.newRecipe.method ?? "")")
                    .padding()
                Text("Ingredients: \(recipesViewModel.newRecipe.ingredients ?? "")")
                    .padding()
            }
            Spacer()
      
            
        }
        
    }
}



struct DetailedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

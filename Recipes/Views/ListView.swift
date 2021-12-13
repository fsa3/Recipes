//
//  ListView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 13.12.21.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var recipesViewModel: RecipesModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.title, ascending: true)],
        animation: .default)
    
    private var recipes: FetchedResults<Recipes>
    
    
    var body: some View {
        Text("Last added recipes")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(Color.blue)
        VStack {
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
            
        }
        
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(recipesViewModel: RecipesModel())
    }
}

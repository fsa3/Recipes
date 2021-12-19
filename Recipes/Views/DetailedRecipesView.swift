//
//  DetailedRecipesView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 13.12.21.
//

import SwiftUI
import Kingfisher

struct DetailedRecipesView: View {
    
    @ObservedObject var recipesViewModel: RecipesModel
    
    let recipe : Recipes
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    Text(" \(recipe.title ?? "")")
                }
                Section(header: Text("Ingredients")) {
                    Text(" \(recipe.ingredients ?? "")")
                }
                Section(header: Text("Method")) {
                    Text(" \(recipe.method ?? "")")
                }
                
            }
            .navigationBarTitle(Text(" \(recipe.title ?? "")"), displayMode: .inline)
        }
        
    }
}



struct DetailedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

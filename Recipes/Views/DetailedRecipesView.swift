//
//  ListView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 13.12.21.
//

import SwiftUI
import Kingfisher

struct DetailedRecipesView: View {
    
    @ObservedObject var recipesViewModel: RecipesModel
    
  /*  @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.title, ascending: true)],
        animation: .default)*/
    
   // private var recipes: FetchedResults<Recipes>
    
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
           /* Section {
                Button(action : addMoveAction ){
                Text("Add Recipes")
              }
            }*/
          }
          .navigationBarTitle(Text(" \(recipe.title ?? "")"), displayMode: .inline)
        }
        
        
    /*    VStack {
            Spacer()
            VStack {
                Text("Title: \(recipe.title ?? "")")
                     .padding()
                Text("Title: \(recipe.ingredients ?? "")")
                     .padding()
                Text("Title: \(recipe.method ?? "")")
                     .padding()
                //TextField("Enter title for recipe", text: Binding($newRecipeModel.newRecipe.title)!)
                
                Text("Title: \(recipesViewModel.newRecipe.title ?? "")")
                    .padding()
                Text("Method: \(recipesViewModel.newRecipe.method ?? "")")
                    .padding()
                Text("Ingredients: \(recipesViewModel.newRecipe.ingredients ?? "")")
                    .padding()
            }
            Spacer()
      
            
        }*/
        
    }
}



struct DetailedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

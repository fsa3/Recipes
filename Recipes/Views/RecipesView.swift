//
//  ViewRecipeScreen.swift
//  Recipes
//
//  Created by Tatjana Krämer on 1.11.2021.
//
import SwiftUI

struct RecipesView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Recipes.entity(),sortDescriptors: [
        NSSortDescriptor(keyPath: \Recipes.title, ascending: true)])
    
    
    var recipes: FetchedResults<Recipes>
    
    @State var isPresented = false
    
    @ObservedObject var recipesViewModel: RecipesModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes, id: \.title) {
                    Row(recipe: $0)
                    
                }
                .onDelete(perform: deleteRecipe)
                
                
                
            }
            .sheet(isPresented: $isPresented) {
                AddRecipes { title, ingredients, method in
                    self.addRecipe(title: title, ingredients: ingredients, method: method)
                    self.isPresented = false
                }
            }
            .navigationBarTitle(Text("My Recipes"))
            .navigationBarItems(trailing:
                                    Button(action: { self.isPresented.toggle() }) {
                Image(systemName: "plus")
            }
            )
        }
    }
    
    func deleteRecipe(at offsets: IndexSet) {
        offsets.forEach { index in
            let recipe = self.recipes[index]
            self.managedObjectContext.delete(recipe)
        }
        saveContext()
    }
    
    
    func addRecipe(title: String, ingredients: String, method: String) {
        
        let newRecipe = Recipes(context: managedObjectContext)
        
        newRecipe.title = title
        newRecipe.ingredients = ingredients
        newRecipe.method = method
        
        saveContext()
    }
    
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

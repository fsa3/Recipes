//
//  ViewRecipeScreen.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI


struct RecipesView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var recipesViewModel: RecipesModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.title, ascending: true)],
        animation: .default)
    
    private var recipes: FetchedResults<Recipes>
    
    
    var body: some View {
        let listEntry = checkData()
        
        if listEntry == false {
            Text("No results")
            
        }
        else{
            
            NavigationView {
                List {
                    ForEach(recipes){ recipe in
                        
                        NavigationLink("Title: \(recipesViewModel.newRecipe.title ?? "")"
                                       , destination: DetailedRecipesView(recipesViewModel: RecipesModel()))
                        
                    }
                    .onDelete(perform: deleteRecipe)
                    
                    
                }
                
            }
        }
        
    }
    
    //delete recipes by swiping right
    private func deleteRecipe(offsets: IndexSet) {
        withAnimation {
            offsets.map { recipes[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //chekc if there are entries
    private func checkData() -> Bool
    {
        if recipes.count == 0
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    
    
    
    
}




struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipesViewModel: RecipesModel())
    }
}

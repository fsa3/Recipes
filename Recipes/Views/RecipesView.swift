//
//  ViewRecipeScreen.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI
import CoreData


struct RecipesView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @ObservedObject var recipesViewModel: RecipesModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.title, ascending: true)],
        animation: .default)
    
    private var recipes: FetchedResults<Recipes>
    
    @State var isPresented = false

    
    var body: some View {

            
            NavigationView {
                List {
                    ForEach(recipes, id: \.title){ recipe in
                         NavigationLink("Title: \(recipesViewModel.newRecipe.title ?? "empty")"
                                       , destination: DetailedRecipesView(recipesViewModel: RecipesModel()))
                    }
                    .onDelete(perform: deleteRecipe)
                    
                    
                }
                .sheet(isPresented: $isPresented) {
                  AddRecipes { title, ingredients, method in
                    self.addRecipe(title: title, method: method, ingredients: ingredients)
                    self.isPresented = false
                  }
                }
                .navigationBarTitle(Text("Doodododo"))
                .navigationBarItems(trailing:
                  Button(action: { self.isPresented.toggle() }) {
                    Image(systemName: "plus")
                  }
                )
                
            }
        
    }
    
    //delete recipes by swiping right
    private func deleteRecipe(offsets: IndexSet) {
        withAnimation {
            offsets.map { recipes[$0] }.forEach(managedObjectContext.delete)
            
            do {
                try managedObjectContext.save()
               // print(managedObjectContext)
                checkData()
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
        var count = 0
        if recipes.count == 0
        {
            count = recipes.count
            print(count)
            return false
        }
        else
        {
            count = recipes.count
            print(count)
            return true
            
        }
    }
    
    func addRecipe(title: String, method: String, ingredients: String) {
        
      let newRecip = Recipes(context: managedObjectContext)

      newRecip.title = title
      newRecip.ingredients = ingredients
      newRecip.method = method
        
        print(newRecip.title ?? "some" )
        checkData()

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

//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import SwiftUI
import CoreData

struct AddRecipes: View {
    static let DefaultTitle = "-I-"
    static let DefaultIngred = "-J-"
    static let DefaultMethod = "-K-"
    
    @State var title = ""
    @State var ingredients = ""
    @State var method = ""
    
    let onComplete: (String, String, String) -> Void
    
  //  @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAlert = false
  //  @StateObject private var newRecipeModel = RecipesModel()

    
    var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Title")) {
            TextField("Title", text: $title)
          }
          Section(header: Text("Ingredients")) {
            TextField("Ingredients", text: $ingredients)
          }
            Section(header: Text("Method")) {
              TextField("Method", text: $method)
            }
          Section {
              Button(action : addMoveAction ){
              Text("Add Recipes")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
            }
          }
        }
        .navigationBarTitle(Text("Add Recipe"), displayMode: .inline)
      }
    }
    
    

    private func addMoveAction() {
      onComplete(
        title.isEmpty ? AddRecipes.DefaultTitle : title,
        ingredients.isEmpty ? AddRecipes.DefaultIngred : ingredients,
        method.isEmpty ? AddRecipes.DefaultMethod : method)
    }

}
    
    /*
    
    @StateObject private var newRecipeModel = RecipesModel()
    @State private var showingAlert = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        VStack {
            
            Text("New Recipe")
                .font(.title.bold())
            
            Spacer()
            
            Text("Enter a title, ingrediants and a method")
                .font(.title2)
                .foregroundColor(.gray)
            HStack{
                Spacer()
                    
                VStack{
                    TextField("Enter title for recipe", text: Binding($newRecipeModel.newRecipe.title)!)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter ingredients", text: Binding($newRecipeModel.newRecipe.ingredients)!)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter method to prepare food", text: Binding($newRecipeModel.newRecipe.method)!)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    
                    Button(action:saveRecipe) {
                        Text("Save")
                        
                        
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
    }
    
    func saveRecipe(){
        _ = Recipes(context: managedObjectContext)
        try? self.managedObjectContext.save()
        
        do {
            try managedObjectContext.save()
            showingAlert = true
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    //clear cache
    
    
    
}

*/


/*--------------------------------------------------------------------------------
 import SwiftUI

 struct AddRecipes: View {
     @StateObject private var newRecipeModel = RecipesModel()
     @State private var showingAlert = false
     @Environment(\.managedObjectContext) var managedObjectContext
     
     
     var body: some View {
         VStack {
             
             Text("New Recipe")
                 .font(.title.bold())
             
             Spacer()
             
             Text("Enter a title, ingrediants and a method")
                 .font(.title2)
                 .foregroundColor(.gray)
             HStack{
                 Spacer()
                     
                 VStack{
                     TextField("Enter title for recipe", text: Binding($newRecipeModel.newRecipe.title)!)
                         .multilineTextAlignment(.leading)
                         .frame(height: 30)
                         .padding()
                         .textFieldStyle(.roundedBorder)
                     
                     TextField("Enter ingredients", text: Binding($newRecipeModel.newRecipe.ingredients)!)
                         .multilineTextAlignment(.leading)
                         .frame(height: 30)
                         .padding()
                         .textFieldStyle(.roundedBorder)
                     
                     TextField("Enter method to prepare food", text: Binding($newRecipeModel.newRecipe.method)!)
                         .multilineTextAlignment(.leading)
                         .frame(height: 30)
                         .padding()
                         .textFieldStyle(.roundedBorder)
                     
                     
                     Button(action:saveRecipe) {
                         Text("Save")
                         
                         
                     }
                     .alert(isPresented: $showingAlert) {
                         Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
                     }
                     
                     Spacer()
                     
                 }
                 
             }
             
         }
     }
     
     func saveRecipe(){
         _ = Recipes(context: managedObjectContext)
         try? self.managedObjectContext.save()
         
         do {
             try managedObjectContext.save()
             showingAlert = true
         } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             let nsError = error as NSError
             fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
     }
     
     //clear cache
     
     
     
 }
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipes ()
    }
}*/


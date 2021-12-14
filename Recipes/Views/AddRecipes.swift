//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import SwiftUI

struct AddRecipes: View {
    @StateObject private var newRecipeModel = RecipesModel()
    @State private var showingAlert = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        VStack {
            Text("New Recipes")
                .font(.title)
            
            Text("Enter you data")
                .font(.title2)
                .foregroundColor(.gray)
            Spacer()
            
            TextField("Enter title for recipe", text: Binding($newRecipeModel.newRecipe.title)!)
                .multilineTextAlignment(.leading)
                .frame(height: 50)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter ingredients", text: Binding($newRecipeModel.newRecipe.ingredients)!)
                .multilineTextAlignment(.leading)
                .frame(height: 50)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter method to prepare food", text: Binding($newRecipeModel.newRecipe.method)!)
                .multilineTextAlignment(.leading)
                .frame(height: 50)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            Button(action:saveRecipe) {
                Text("Save")
                
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
            }
            
            Spacer()
            
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
        AddRecipes()
    }
}

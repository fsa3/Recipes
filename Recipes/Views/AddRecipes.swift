//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import SwiftUI

struct AddRecipes: View {
    @StateObject private var newRecipeModel = RecipesModel()
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
                .onDisappear {
                    try? self.managedObjectContext.save()
                }
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .border(.secondary)
                .padding()
          
            TextField("Enter method to prepare food", text: Binding($newRecipeModel.newRecipe.method)!)
                .onDisappear {
                    try? self.managedObjectContext.save()
                }
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .border(.secondary)
                .padding()
           
            TextField("Enter ingredients", text: Binding($newRecipeModel.newRecipe.ingredients)!)
                .onDisappear {
                    try? self.managedObjectContext.save()
                }
                .multilineTextAlignment(.center)
                .frame(height: 50)
                .border(.secondary)
                .padding()
            
            Spacer()
            
            Button(action: {
                try? self.managedObjectContext.save()
            }) {
                Text("Save")
            }
            Spacer()
            
        }
    }
}






struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipes()
    }
}

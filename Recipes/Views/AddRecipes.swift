//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import SwiftUI

struct AddRecipes: View {
    @StateObject private var newRecipesModel = RecipesModel()

    var body: some View {
        VStack {
            Text("New Recipes")
                .font(.title)

            Text("Enter you data")
                .font(.title2)
                .foregroundColor(.gray)
                Spacer()
            
            TextField(" Enter Title", text: $newRecipesModel.newRecipesModel.title)
                .frame(height: 50)
                .border(.secondary)
                .padding()
            
            TextField(" Enter method", text: $newRecipesModel.newRecipesModel.method)
                .frame(height: 50)
                .border(.secondary)
                .padding()
            
            TextField(" Enter ingredients", text: $newRecipesModel.newRecipesModel.ingredients)
                .frame(height: 50)
                .border(.secondary)
                .padding()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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

//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//

import SwiftUI
import CoreData

struct AddRecipes: View {
    static let DefaultTitle = "-new recipe-"
    static let DefaultIngred = "-some ingredients-"
    static let DefaultMethod = "-start cooking-"
    
    @State var title = ""
    @State var ingredients = ""
    @State var method = ""
    
    let onComplete: (String, String, String) -> Void
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Give your recipe a title", text: $title)
                }
                Section(header: Text("Ingredients")) {
                    TextField("Add some ingredients", text: $ingredients)
                }
                Section(header: Text("Method")) {
                    TextField("How does it need to be cooked?", text: $method)
                }
                Section {
                    Button(action : addMoveAction ){
                        Text("Add Recipe")
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




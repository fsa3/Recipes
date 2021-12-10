//
//  CardView.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI

struct CardView: View {
    @StateObject var apiViewModel = ApiViewModel(searchQuery: "dinner")
    
    @State private var apiSearchString: String = ""
        
    var body: some View {
        NavigationView {
            VStack {
                TextField( " Search for a recipe", text: $apiSearchString)
                    .multilineTextAlignment(.leading)
                    .frame(height: 40)
                    .border(.secondary)
                    .padding()
                    .onSubmit {
                        apiViewModel.getRecipes(searchQuery: apiSearchString)
                    }
                
                let recipes = apiViewModel.recipesInResult
                if apiViewModel.loading {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                else if recipes.isEmpty {
                    Spacer()
                    Text("No results")
                    Spacer()
                }
                else {
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 100, maximum: 250), spacing: 12, alignment: .top),
                            GridItem(.flexible(minimum: 100, maximum: 200), alignment: .top)
                        ], spacing: 16, content: {
                            ForEach(recipes, id: \.self) { recipe in
                                NavigationLink(destination: RecipeView(recipe: recipe)) {
                                    Card(recipe: recipe)
                                }
                                .buttonStyle(PlainButtonStyle()) 
                            }
                        }).padding(.horizontal, 5)
                    }
                }
            }
            .navigationTitle("Browse Recipes")
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}




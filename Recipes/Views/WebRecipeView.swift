//
//  RecipeView.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 10.12.2021.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    let recipe: Recipe
    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: recipe.image)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        TextOverlay(recipe: recipe)
                    }
                VStack {
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        IngredientView(ingredient: ingredient)
                    }
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                if recipe.webRecipe {
                    NavigationLink(destination: {
                        WebpageView(url: URL(string: recipe.url)!)
                            .edgesIgnoringSafeArea(.all)
                            .navigationBarTitle(recipe.title)
                    }) {
                        Text("See method")
                            .padding()
                    }
                }
            }
        }
    }
}

struct TextOverlay: View {
    var recipe: Recipe
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.title)
                    .bold()
                Text(recipe.dishType ?? "")
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.example)
    }
}

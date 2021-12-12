//
//  IngredientView.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 10.12.2021.
//

import SwiftUI
import Kingfisher

struct IngredientView: View {
    let ingredient: Ingredient
    
    var body: some View {
        HStack {
            if let img = ingredient.image {
                KFImage(URL(string: img)!)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
                    .padding(.leading)
            }
            Text(ingredient.text)
            Spacer()
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
        .background(Color(red: 0.88, green: 0.88, blue: 0.78))
        .cornerRadius(5)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: Ingredient(text: "3 onions", image: nil))
    }
}

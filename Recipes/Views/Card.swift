//
//  Card.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 5.11.2021.
//

import SwiftUI

struct Card: View {
    let recipe: Recipe

    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.yellow)
            VStack(alignment: .center, spacing: 4) {
                Image("image")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                Text(recipe.title)
                    .font(.system(size: 20, weight: .semibold))
            }
            .padding()
//                        .background(.red)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(recipe: Recipe.example)
    }
}
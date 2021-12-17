//
//  Row.swift
//  Recipes
//
//  Created by Tatjana Krämer on 17.12.21.
//

import SwiftUI

struct Row: View {
  let recipe: Recipes


  var body: some View {
    VStack(alignment: .leading) {
      recipe.title.map(Text.init)
        .font(.title)
      HStack {
        recipe.ingredients.map(Text.init)
          .font(.caption)
        Spacer()
      }
    }
  }
}


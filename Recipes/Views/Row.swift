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
      NavigationLink(" \(recipe.title ?? "")",
                     destination: DetailedRecipesView(recipesViewModel: RecipesModel(), recipe:recipe))
  }
}


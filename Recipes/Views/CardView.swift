//
//  CardView.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//

import SwiftUI

struct CardView: View {
    @StateObject var apiViewModel = ApiViewModel()
    
    var body: some View {
        let recipes = apiViewModel.recipesInResult
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 250), spacing: 12, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), alignment: .top)
                ], spacing: 16, content: {
                    ForEach(recipes, id: \.self) { recipe in
                        Card(recipe: recipe)
                    }
                }).padding(.horizontal, 5)
            }
            .navigationTitle("Recipes")
        }
    }
}

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

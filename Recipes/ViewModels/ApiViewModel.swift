//
//  ApiViewModel.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 6.11.2021.
//

import Foundation
import SwiftUI
import Combine

struct Response: Codable {
    var hits: [Hit]
}

struct Hit: Codable {
    var recipe: RecipeApi
}

struct RecipeApi: Codable {
    var label: String
    var image: String
    var dishType: [String]?
    var ingredients: [Ingredient]
    var url: String
}


class ApiViewModel: ObservableObject{
    let session = URLSession(configuration: .default)
    let baseUrl = "https://api.edamam.com/api/recipes/v2?type=public&q="
    let appId = "&app_id=6838f9a7&app_key=9522aa691ea95b1892b63f607213286b"
    var cancellable: Cancellable? = nil
    
    @Published var recipesInResult: [Recipe] = []
    @Published var loading = false
    
    init(searchQuery: String){self.getRecipes(searchQuery: searchQuery)
    }
    
    func getRecipes(searchQuery: String) {
        self.loading = true
        let searchQueryEncoded = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let recipesUrl = baseUrl + searchQueryEncoded + appId
        let url = URL(string: recipesUrl)!
        cancellable?.cancel()
        cancellable = session
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                print ("Received completion: \($0).") },
                  receiveValue: { [weak self] response in
                self?.loading = false
                self?.recipesInResult.removeAll()
                for hit in response.hits {
                    self?.recipesInResult.append(Recipe(recipe: hit.recipe))
                }
            })
    }
}

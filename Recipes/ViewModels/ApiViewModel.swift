//
//  ApiViewModel.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 6.11.2021.
//

import Foundation
import SwiftUI

struct Response: Codable {
    var hits: [Hit]
}

struct Hit: Codable {
    var recipe: RecipeApi
}

struct RecipeApi: Codable {
    var label: String
    var image: String
}


class ApiViewModel: ObservableObject{
    let session = URLSession(configuration: .default)
    let timeWebServiceUrl = "https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=6838f9a7&app_key=9522aa691ea95b1892b63f607213286b"
    var currentTask: URLSessionDataTask? = nil
    let jsonDecoder = JSONDecoder()
    
    @Published var recipesInResult: [Recipe] = []
    
    init() {
        var request = URLRequest(url: URL(string: timeWebServiceUrl)!)
        request.httpMethod = "GET"
        currentTask?.cancel()
        currentTask = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            print("received response")
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data, let time = try? self?.jsonDecoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    for hit in time.hits {
                        self?.recipesInResult.append(Recipe(recipe: hit.recipe))
                    }
                }
            } else {
                print("Something went wrong. Try again.")
            }
        })
        currentTask?.resume()
    }
}

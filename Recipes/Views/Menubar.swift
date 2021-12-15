//
//  Menubar.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 1.11.2021.
//
// 2021-11-2:
// Changes by Tatjana
// added tab bar to menubar view

import SwiftUI

struct Menubar: View {
   
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
    }
        
    var body: some View {
        
        VStack {
            
            TabView {
                RecipesView(recipesViewModel: RecipesModel())
                    .tabItem {
                        Label("My Recipes", systemImage: "house")
                    }
                
                CardView()
                    .tabItem {
                        Label("Browse Recipes", systemImage: "menucard")
                    }
                
             //   AddRecipes(title, ingredients, method in
              //             self.addRecipes(title: title, ingredients: ingredients, method: method)
                          // self.isPresented = false
             //   )
                    .tabItem {
                        Label("New Recipe", systemImage: "plus")
                    }
            }
        }
        
    }
    
    
    
}

struct Menubar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Menubar()
        }
    }
}

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
    var body: some View {
        /* MenuBar View */
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            
            SearchScreenView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            ViewRecipeScreen()
                .tabItem {
                    Label("My Recipes", systemImage: "menucard")
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

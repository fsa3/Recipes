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
    
    @State private var searchstring: String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                HStack {
                    TextField( " Search for a recipe", text: $searchstring)
                        .multilineTextAlignment(.leading)
                        .frame(height: 40)
                        .border(.secondary)
                        .padding()
                    
                    Spacer()
                    HStack {
                        
                    }
                }
            }
            .padding()
            
            
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            
            SearchScreenView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            LibraryScreen()
                .tabItem {
                    Label("My Recipes", systemImage: "menucard")
                }
            AddRecipes()
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

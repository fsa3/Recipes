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
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "plus").foregroundColor(.white)
                        }
                        .padding(9.0)
                        .background(.green)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white))
                        .shadow(radius: 2)
                    .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                    }
                    .padding()
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

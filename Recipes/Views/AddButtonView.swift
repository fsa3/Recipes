//
//  AddButtonView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 02.11.21.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }
                .padding(9.0)
                .background(.green)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white))
                .shadow(radius: 2)
            .controlSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
            }
        }
    
    }
}
    

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}

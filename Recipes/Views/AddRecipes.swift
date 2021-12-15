//
//  SwiftUIView.swift
//  Recipes
//
//  Created by Tatjana Krämer on 15.11.21.
//
/*
 struct AddMovie: View {
   static let DefaultMovieTitle = "An untitled masterpiece"
   static let DefaultMovieGenre = "Genre-buster"

   @State var title = ""
   @State var genre = ""
   @State var releaseDate = Date()
   let onComplete: (String, String, Date) -> Void

   var body: some View {
     NavigationView {
       Form {
         Section(header: Text("Title")) {
           TextField("Title", text: $title)
         }
         Section(header: Text("Genre")) {
           TextField("Genre", text: $genre)
         }
         Section {
           DatePicker(
             selection: $releaseDate,
             displayedComponents: .date) {
               Text("Release Date").foregroundColor(Color(.gray))
           }
         }
         Section {
           Button(action: addMoveAction) {
             Text("Add Movie")
           }
         }
       }
       .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
     }
   }

   private func addMoveAction() {
     onComplete(
       title.isEmpty ? AddMovie.DefaultMovieTitle : title,
       genre.isEmpty ? AddMovie.DefaultMovieGenre : genre,
       releaseDate)
   }
 }*/

import SwiftUI

struct AddRecipes: View {
    static let DefaultMovieTitle = "-T-"
    static let DefaultMovieIngred = "-I-"
    static let DefaultMovieMethod = "-I-"
    
    @State var title = ""
    @State var ingrediants = ""
    @State var method = ""
    let onComplete: (String, String, String) -> Void
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAlert = false

    
    
    var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Title")) {
            TextField("Title", text: $title)
          }
          Section(header: Text("Ingredients")) {
            TextField("Ingredients", text: $ingrediants)
          }
            Section(header: Text("Method")) {
              TextField("Method", text: $method)
            }
          Section {
              Button(action : addMoveAction ){
                //action: addRecipe(title: title, ingredients: ingrediants, method: method)) {
              Text("Add Recipes")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
            }
          }
        }
        .navigationBarTitle(Text("Add Recipe"), displayMode: .inline)
      }
    }
    
    

    private func addMoveAction() {
      onComplete(
        title.isEmpty ? AddRecipes.DefaultMovieTitle : title,
        ingrediants.isEmpty ? AddRecipes.DefaultMovieTitle : ingrediants,
        method.isEmpty ? AddRecipes.DefaultMovieTitle : method)
    }
    
    
    
    func addRecipe(title: String, ingredients: String, method: String) {
      // 1
      let newRecipe = Recipes(context: managedObjectContext)

      // 2
      newRecipe.title = title
      newRecipe.ingredients = ingredients
      newRecipe.method = method

      // 3
      saveContext()
    }


    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
    
    
    
    
    func saveRecipe(){
        _ = Recipes(context: managedObjectContext)
        try? self.managedObjectContext.save()
        
        do {
            try managedObjectContext.save()
            showingAlert = true
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
    
    /*
    
    @StateObject private var newRecipeModel = RecipesModel()
    @State private var showingAlert = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        VStack {
            
            Text("New Recipe")
                .font(.title.bold())
            
            Spacer()
            
            Text("Enter a title, ingrediants and a method")
                .font(.title2)
                .foregroundColor(.gray)
            HStack{
                Spacer()
                    
                VStack{
                    TextField("Enter title for recipe", text: Binding($newRecipeModel.newRecipe.title)!)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter ingredients", text: Binding($newRecipeModel.newRecipe.ingredients)!)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter method to prepare food", text: Binding($newRecipeModel.newRecipe.method)!)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    
                    Button(action:saveRecipe) {
                        Text("Save")
                        
                        
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
                    }
                    
                    Spacer()
                    
                }
                
            }
            
        }
    }
    
    func saveRecipe(){
        _ = Recipes(context: managedObjectContext)
        try? self.managedObjectContext.save()
        
        do {
            try managedObjectContext.save()
            showingAlert = true
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    //clear cache
    
    
    
}

*/


/*--------------------------------------------------------------------------------
 import SwiftUI

 struct AddRecipes: View {
     @StateObject private var newRecipeModel = RecipesModel()
     @State private var showingAlert = false
     @Environment(\.managedObjectContext) var managedObjectContext
     
     
     var body: some View {
         VStack {
             
             Text("New Recipe")
                 .font(.title.bold())
             
             Spacer()
             
             Text("Enter a title, ingrediants and a method")
                 .font(.title2)
                 .foregroundColor(.gray)
             HStack{
                 Spacer()
                     
                 VStack{
                     TextField("Enter title for recipe", text: Binding($newRecipeModel.newRecipe.title)!)
                         .multilineTextAlignment(.leading)
                         .frame(height: 30)
                         .padding()
                         .textFieldStyle(.roundedBorder)
                     
                     TextField("Enter ingredients", text: Binding($newRecipeModel.newRecipe.ingredients)!)
                         .multilineTextAlignment(.leading)
                         .frame(height: 30)
                         .padding()
                         .textFieldStyle(.roundedBorder)
                     
                     TextField("Enter method to prepare food", text: Binding($newRecipeModel.newRecipe.method)!)
                         .multilineTextAlignment(.leading)
                         .frame(height: 30)
                         .padding()
                         .textFieldStyle(.roundedBorder)
                     
                     
                     Button(action:saveRecipe) {
                         Text("Save")
                         
                         
                     }
                     .alert(isPresented: $showingAlert) {
                         Alert(title: Text("Saved"), message: Text("New recipes is added to My Recipes"), dismissButton: .default(Text("OK!")))
                     }
                     
                     Spacer()
                     
                 }
                 
             }
             
         }
     }
     
     func saveRecipe(){
         _ = Recipes(context: managedObjectContext)
         try? self.managedObjectContext.save()
         
         do {
             try managedObjectContext.save()
             showingAlert = true
         } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             let nsError = error as NSError
             fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
     }
     
     //clear cache
     
     
     
 }
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipes ()
    }
}*/


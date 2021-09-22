//
//  DetailViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/13/21.
//

import Foundation

class DetailViewModel: ObservableObject{
    @Published var isBookmarked: Bool
    
    //dependencies
    private let database: Database

    init(database: Database) {
        self.database = database
        self.isBookmarked = false
    }
    
    func bookmarkRecipe(recipe: Recipe){
        database.bookmarkRecipe(recipe: recipe)
        checkIfRecipeIsBookmarked(recipe: recipe)
    }
    
    func toggleBookmark(recipe: Recipe){
        if !isBookmarked{
            database.bookmarkRecipe(recipe: recipe)
        }
        else{
            database.removeBookmark(recipe: recipe)
        }
        checkIfRecipeIsBookmarked(recipe: recipe)
    }
    
    func checkIfRecipeIsBookmarked(recipe: Recipe){
        isBookmarked = database.checkIfRecipeIsBookmarked(recipe: recipe)
    }
    
}

extension Dependency{
    var detailViewModel: DetailViewModel{
        DetailViewModel(database: database)
    }
}

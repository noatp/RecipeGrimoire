//
//  DetailViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/13/21.
//

import Foundation

class DetailViewModel: ObservableObject{
    @Published var isBookmarked: Bool = false
    
    //dependencies
    private let database: Database

    var recipe: Recipe = Recipe.preview

    init(database: Database) {
        self.database = database
    }
    
    func bookmarkRecipe(recipe: RecipeDTO){
        database.bookmarkRecipe(recipe: recipe)
        isRecipeBookmarked(recipe: recipe)
    }
    
    func isRecipeBookmarked(recipe: RecipeDTO){
        isBookmarked = database.isRecipeBookmarked(recipe: recipe)
    }
    
}

extension Dependency{
    var detailViewModel: DetailViewModel{
        DetailViewModel(database: database)
    }
}

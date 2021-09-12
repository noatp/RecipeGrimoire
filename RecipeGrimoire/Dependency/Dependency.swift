//
//  Dependency.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import Foundation
import UIKit

class Dependency{
    static let shared = Dependency()
    static let preview = Dependency(recipeService: MockRecipeService())
    var recipeService: RecipeService
    
    init(
        recipeService: RecipeService = RecipeService()
    ){
        self.recipeService = recipeService
    }
        
}

class MockRecipeService: RecipeService{
    override func fetchRecipes(with searchTerm: String?) {
        self.fetchRecipesState = FetchRecipesState(isLoading: false, moreRecipeAvailable: true, recipeList: Recipe.previewList)
    }
}



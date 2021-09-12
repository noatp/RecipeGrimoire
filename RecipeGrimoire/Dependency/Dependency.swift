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
    init(
        isLoading: Bool = false,
        moreRecipeAvailable: Bool = false
    ) {
        super.init(
            initFetchRecipesState: FetchRecipesState(
                isLoading: isLoading,
                moreRecipeAvailable: moreRecipeAvailable,
                recipeList: Recipe.previewList
            )
        )
    }
}



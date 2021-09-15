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
    static let preview = Dependency(recipeService: MockRecipeService(), database: MockDatabase())
    
    var recipeService: RecipeService
    var database: Database
    
    init(
        recipeService: RecipeService = RecipeService(),
        database: Database = Database()
    ){
        self.recipeService = recipeService
        self.database = database
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
                recipeList: RecipeDTO.previewList
            )
        )
    }
}

class MockDatabase: Database{
    init(
        recipes: [RecipeDTO] = RecipeDTO.previewList
    ){
        super.init(
            initBookmarkedRecipeList: recipes
        )
    }
}



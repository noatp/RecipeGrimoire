//
//  BookmarkViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import Combine

class BookmarkViewModel: ObservableObject{
    @Published var bookmarkedRecipeList: [RecipeDTO] = []
    
    //dependencies
    private let database: Database
    
    init(database: Database) {
        self.database = database
    }
    
    func getAllBookmarkedRecipe(){
        bookmarkedRecipeList = database.getAllBookmarkedRecipe()
    }
}

extension Dependency{
    var bookmarkViewModel: BookmarkViewModel{
        BookmarkViewModel(database: database)
    }
}

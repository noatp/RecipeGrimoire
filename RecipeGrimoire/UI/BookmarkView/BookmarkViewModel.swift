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
    
    private var bookmarkedRecipeListSubscription: AnyCancellable?

    init(database: Database) {
        self.database = database
        addSubscription()
    }
    
    func getAllBookmarkedRecipe(){
        database.getAllBookmarkedRecipe()
        print("FUCK YOU TOO \(bookmarkedRecipeList)")
    }
    
    func addSubscription(){
        bookmarkedRecipeListSubscription = database.$bookmarkedRecipeList
            .sink { [weak self] databaseRecipeList in
                self?.bookmarkedRecipeList = databaseRecipeList
            }
    }
}

extension Dependency{
    var bookmarkViewModel: BookmarkViewModel{
        BookmarkViewModel(database: database)
    }
}

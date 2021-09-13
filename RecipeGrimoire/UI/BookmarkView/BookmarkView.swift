//
//  BookmarkView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject private var bookmarkViewModel: BookmarkViewModel
    
    init(dependency: Dependency = Dependency.preview) {
        self.bookmarkViewModel = dependency.bookmarkViewModel
    }
    
    var body: some View {
        List{
            ForEach(bookmarkViewModel.bookmarkedRecipeList) { bookmarkedRecipe in
                ListItem(recipe: bookmarkedRecipe)
            }
        }
        .onAppear{
            bookmarkViewModel.getAllBookmarkedRecipe()
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}

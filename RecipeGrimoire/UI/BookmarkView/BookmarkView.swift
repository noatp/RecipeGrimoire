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
                NavigationLink(
                    destination: DetailView(dependency: .shared, recipe: bookmarkedRecipe),
                    label: {
                        ListItem(recipe: bookmarkedRecipe)
                    }
                )
                .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
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

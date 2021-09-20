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
        VStack(alignment: .leading){
            Image("titleLogo")
                .resizable()
                .padding(.top, 16.0)
                .scaledToFit()
                .frame(width: 150)
            Text("Bookmark")
                .font(.largeTitle)
                .fontWeight(.heavy)
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
            .listStyle(InsetListStyle())
            .onAppear{
                bookmarkViewModel.getAllBookmarkedRecipe()
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            BookmarkView()
        }
    }
}

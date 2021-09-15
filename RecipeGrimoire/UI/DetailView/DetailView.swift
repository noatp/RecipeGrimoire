//
//  DetailView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var detailViewModel: DetailViewModel
    private let recipe: RecipeDTO
    
    init(dependency: Dependency = Dependency.preview, recipe: RecipeDTO) {
        self.detailViewModel = dependency.detailViewModel
        self.recipe = recipe
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView(showsIndicators: false){
                URLImage(url: recipe.featuredImage)
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: 300)
                    .clipped()
                    .cornerRadius(10)
                VStack(alignment: .leading){
                    HStack{
                        Text(recipe.title)
                            .font(.title)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Button(action: {detailViewModel.bookmarkRecipe(recipe: recipe)}){
                            Image(systemName: detailViewModel.isBookmarked ? "bookmark.fill" : "bookmark")
                                .foregroundColor(detailViewModel.isBookmarked ? .yellow : .gray)
                                .font(.title)
                            
                        }
                        .onAppear{
                            detailViewModel.isRecipeBookmarked(recipe: recipe)
                        }
                    }
                    
                    Text("by " + (recipe.publisher ))
                        .font(.caption)
                    Divider()
                    Text("Ingredient")
                        .font(.title2)
                    ForEach(recipe.ingredients , id: \.self) { ingredient in
                        Text("- " + ingredient)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Recipe Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(recipe: RecipeDTO.preview)
    }
}

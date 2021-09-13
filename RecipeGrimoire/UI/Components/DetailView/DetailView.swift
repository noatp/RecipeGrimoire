//
//  DetailView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct DetailView: View {
    let recipe: Recipe
    
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
                    Text(recipe.title)
                        .font(.title)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
        DetailView(recipe: Recipe.preview)
    }
}

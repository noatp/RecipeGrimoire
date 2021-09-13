//
//  ListItem.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct ListItem: View {
    var recipe: Recipe
    
    var body: some View {
        HStack{
            URLImage(url: recipe.featuredImage)
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
            Text(recipe.title)
                .font(.headline)
                .bold()
                .padding(.leading)
            Spacer()

        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(recipe: Recipe.preview)
            .previewLayout(.sizeThatFits)
    }
}

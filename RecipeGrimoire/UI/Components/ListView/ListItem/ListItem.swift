//
//  ListItem.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct ListItem: View {
    @ObservedObject private var urlImageViewModel: URLImageViewModel
    private var recipe: RecipeDTO
    
    init(recipe: RecipeDTO){
        urlImageViewModel = URLImageManager.shared.getURLImageViewModel(url: recipe.featuredImage)
        self.recipe = recipe
    }
    
    var body: some View {
        Group{
            if urlImageViewModel.image != nil{
                itemContent
            }
            else {
                itemContentLoading
            }
        }
        .onAppear(perform: urlImageViewModel.load)
        .onDisappear(perform: urlImageViewModel.cancel)
    }
    
    var itemContent: some View{
        HStack{
            Image(uiImage: urlImageViewModel.image!)
                .resizable()
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
    
    var itemContentLoading: some View{
        HStack{
            ShimmeringRect()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                ShimmeringRect()
                    .frame(width: 200, height: 18)
                ShimmeringRect()
                    .frame(width: 250, height: 18)
            }
            Spacer()
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(recipe: RecipeDTO.preview)
            .previewLayout(.sizeThatFits)
    }
}

//
//  URLImage.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject var urlImageViewModel = URLImageViewModel()
    var recipe: Recipe
    
    var body: some View {
        VStack{
            switch urlImageViewModel.urlImageState {
            case .loading:
                ProgressView()
            case .loaded(let image):
                if let uiImage = image{
                    Image(uiImage: uiImage)
                        .resizable()
                }
                else
                {
                    Image(systemName: "questionmark")
                        .resizable()
                }
            }
        }
        .onAppear{
            urlImageViewModel.getImage(from: recipe.featuredImage ?? "")
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(
            urlImageViewModel: URLImageViewModel(
                imageService: ValidLoadedImageService()
            ),
            recipe: Recipe.preview)
    }
}

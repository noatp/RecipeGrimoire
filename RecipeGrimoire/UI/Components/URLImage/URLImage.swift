//
//  URLImage.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject private var urlImageViewModel: URLImageViewModel
    
    init(url: String?) {
        if let url = url{
            urlImageViewModel = URLImageManager.shared.getURLImageViewModel(url: url)
        }
        else{
            urlImageViewModel = URLImageManager.shared.getURLImageViewModel(url: "")
        }
    }
    
    var body: some View {
        VStack{
            image
        }
        .onAppear(perform: urlImageViewModel.load)
        .onDisappear(perform: urlImageViewModel.cancel)
    }
    
    private var image: some View {
        Group {
            if urlImageViewModel.image != nil {
                Image(uiImage: urlImageViewModel.image!)
                    .resizable()

            } else {
                Image(systemName: "photo")
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
        URLImage(url: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/583/featured_image.png")
    }
}

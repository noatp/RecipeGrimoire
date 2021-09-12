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
        image
            .onAppear(perform: urlImageViewModel.load)
            .onDisappear(perform: urlImageViewModel.cancel)
    }
    
    private var image: some View {
        Group {
            if urlImageViewModel.image != nil {
                Image(uiImage: urlImageViewModel.image!)
                    .resizable()
            } else {
                ProgressView()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}

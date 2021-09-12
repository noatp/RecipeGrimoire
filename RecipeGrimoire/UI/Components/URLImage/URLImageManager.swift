//
//  URLImageManager.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation

class URLImageManager
{
    private init(){}
    
    static let shared = URLImageManager()
    
    var imageViewModels: [String: URLImageViewModel] = [:]
    
    func getURLImageViewModel(url: String) -> URLImageViewModel{
        if (imageViewModels[url] == nil){
            let newViewModel = URLImageViewModel(url: url)
            imageViewModels[url] = newViewModel
            return newViewModel
        }
        else
        {
            return imageViewModels[url]!
        }
    }
}

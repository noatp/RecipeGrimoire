//
//  URLImageViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import UIKit
import Combine

class URLImageViewModel: ObservableObject{
    @Published var urlImageState: URLImageState = .loading
    private var imageService: ImageService
    private var imageSubscription: AnyCancellable?
    
    init(imageService: ImageService = ImageService()){
        self.imageService = imageService
        addSubscription()
    }
    
    func addSubscription(){
        imageSubscription = imageService.$imageState
            .sink(receiveValue: { [weak self] imageState in
                switch imageState{
                case .loading:
                    self?.urlImageState = .loading
                case .loaded(let image):
                    self?.urlImageState = .loaded(image: image)
                }
            })
    }
    
    func getImage(from imageUrl: String){
        imageService.getImage(from: imageUrl)
    }
        
    enum URLImageState{
        case loading
        case loaded(image: UIImage?)
    }
}


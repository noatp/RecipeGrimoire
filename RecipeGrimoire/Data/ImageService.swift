//
//  ImageService.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation

import Foundation
import SwiftUI
import Combine

class ImageService{
    @Published var imageState: ImageState = .loading
    var imageSubscription: AnyCancellable?
    
    func getImage(from imageUrl: String){
        guard let url  = URL(string: imageUrl)
        else{
            print("ImageService.getImage: bad url")
            return
        }
        
        imageSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap{ publisherOutput -> UIImage? in
                guard let outputResponse = publisherOutput.response as? HTTPURLResponse,
                      (200...299).contains(outputResponse.statusCode)
                else{
                    throw URLError(.badServerResponse)
                }
                return UIImage(data: publisherOutput.data)
            }
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print("ImageService.getImage: \(error.localizedDescription)")
                }
            } receiveValue: {[weak self] (returnedImage) in
                self?.imageState = .loaded(image: returnedImage)
                self?.imageSubscription?.cancel()
            }
        
    }
    
    enum ImageState{
        case loading
        case loaded(image: UIImage?)
    }
}

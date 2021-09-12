//
//  URLImageViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import UIKit
import Combine

class URLImageViewModel: ObservableObject {
    @Published var image: UIImage?
    private let url: String
    private var cancellable: AnyCancellable?
    
    init(url: String) {
        self.url = url
    }
    
    func load() {
        guard let urlObject = URL(string: url)
        else{
            print("bad url: \(url)")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: urlObject)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

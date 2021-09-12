//
//  LiveTextFieldViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import Combine

class LiveTextFieldViewModel: ObservableObject{
    @Published var searchTerm: String = ""
    
    private var recipeService: RecipeService
    private var liveTextSubscription: AnyCancellable?

    init(recipeService: RecipeService){
        self.recipeService = recipeService
        addSubscription()
    }
    
    func addSubscription(){
        liveTextSubscription = $searchTerm
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] searchText in
                self?.recipeService.fetchRecipes(with: searchText)
            })
    }
    
}

extension Dependency{
    var liveTextFieldViewModel: LiveTextFieldViewModel{
        return LiveTextFieldViewModel(recipeService: recipeService)
    }
}

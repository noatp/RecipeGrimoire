//
//  ListViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import Combine

class ListViewModel: ObservableObject{
    @Published var listViewState: ListViewState = .empty
    private var recipeService: RecipeService
    private var recipeListSubscription: AnyCancellable?
    
    init(recipeService: RecipeService) {
        self.recipeService = recipeService
        addSubscription()
    }
    
    func addSubscription(){
        recipeListSubscription = recipeService.$fetchRecipesState
            .sink(receiveValue: { [weak self] fetchRecipesState in
                print(fetchRecipesState)
                self?.listViewState.isLoading = fetchRecipesState.isLoading
                self?.listViewState.moreRecipeAvailable = fetchRecipesState.moreRecipeAvailable
                self?.listViewState.recipeList = fetchRecipesState.recipeList
            })
    }
    
    func fetchNextPage(){
        recipeService.fetchRecipes(with: nil)
    }
    
    struct ListViewState{
        var isLoading: Bool
        var moreRecipeAvailable: Bool
        var recipeList: [Recipe]
        
        static let empty = ListViewState(isLoading: true, moreRecipeAvailable: false, recipeList: [])
    }
}

extension Dependency{
    var listViewModel: ListViewModel{
        return ListViewModel(recipeService: recipeService)
    }
}

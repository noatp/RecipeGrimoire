//
//  RecipeService.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import Foundation
import Combine

class RecipeService{
    private let jsonDecoder = JSONDecoder()
    
    @Published var fetchRecipesState: FetchRecipesState
    private var nextPageUrl = ""
    private var currentQuery = ""
    private var urlString = ""
    private var recipeList: [Recipe] = []
    private var fetchRecipesSubscription: AnyCancellable?

    init(initFetchRecipesState: FetchRecipesState = .empty) {
        self.fetchRecipesState = initFetchRecipesState
    }
    
    func fetchRecipes(with searchTerm: String?){
        
        //if there is a searchTerm -> fresh search
        //if there is NOT a searchTerm -> fetch more page
        if let query = searchTerm{
            //init new search
            fetchRecipesSubscription?.cancel()
            nextPageUrl = ""
            currentQuery = query
            fetchRecipesState = .empty
            recipeList = []
            urlString = "https://food2fork.ca/api/recipe/search/?page=1&query=\(query)"
//            print("requesting \(urlString)")
        }
        else{
            urlString = nextPageUrl
        }
        
        guard let url = URL(string: urlString)
        else{
            print("RecipeService.searchForRecipes: bad url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = ["Authorization": "Token 9c8b06d329136da358c2d00e76946b0111ce2c48"]
        
        fetchRecipesSubscription = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ publisherOutput in
                guard let outputResponse = publisherOutput.response as? HTTPURLResponse,
                      (200...299).contains(outputResponse.statusCode)
                else{
                    throw URLError(.badServerResponse)
                }
                return publisherOutput.data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: Response.self, decoder: jsonDecoder)
            .sink(
                receiveCompletion: { completionResult in
                    switch completionResult{
                    case .finished:
                        break
                    case .failure(let error):
                        print("RecipeService.searchForRecipes: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] returnedResponse in
                    self?.nextPageUrl = returnedResponse.next ?? ""
                    self?.recipeList.append(contentsOf: returnedResponse.results)
                    self?.fetchRecipesState = FetchRecipesState(
                        isLoading: false,
                        moreRecipeAvailable: Bool(self?.nextPageUrl == "") ? false : true,
                        recipeList: self?.recipeList ?? []
                    )
                }
            )
    }
    
//    func getRecipeById(_ recipeId: Int){
//        guard let url = URL(string: "https://food2fork.ca/api/recipe/get/?id=\(recipeId)")
//        else{
//            print("RecipeService.getRecipeById: bad url")
//            return
//        }
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.allHTTPHeaderFields = ["Authorization": "Token 9c8b06d329136da358c2d00e76946b0111ce2c48"]
//        
//        fetchRecipesSubscription = URLSession.shared.dataTaskPublisher(for: urlRequest)
//            .subscribe(on: DispatchQueue.global(qos: .default))
//            .tryMap({ publisherOutput in
//                guard let outputResponse = publisherOutput.response as? HTTPURLResponse,
//                      (200...299).contains(outputResponse.statusCode)
//                else{
//                    throw URLError(.badServerResponse)
//                }
//                return publisherOutput.data
//            })
//            .receive(on: DispatchQueue.main)
//            .decode(type: Recipe.self, decoder: jsonDecoder)
//            .sink(
//                receiveCompletion: { completionResult in
//                    switch completionResult{
//                    case .finished:
//                        break
//                    case .failure(let error):
//                        print("RecipeService.getRecipeById: \(error.localizedDescription)")
//                    }
//                },
//                receiveValue: { [weak self] returnedRecipe in
////                    self?.bookmarkRecipeList.append(returnedRecipe)
//                }
//            )
//    }
    
    struct FetchRecipesState{
        var isLoading: Bool
        var moreRecipeAvailable: Bool
        var recipeList: [Recipe]
        
        static let empty = FetchRecipesState(isLoading: true, moreRecipeAvailable: false, recipeList: [])
    }
}

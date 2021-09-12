//
//  ListView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var listViewModel: ListViewModel
    
    init(dependency: Dependency = .preview) {
        self.listViewModel = dependency.listViewModel
    }
    
    var body: some View {
        List{
            if (listViewModel.listViewState.recipeList.isEmpty && !listViewModel.listViewState.isLoading){
                noResultText
            }
            else if (listViewModel.listViewState.isLoading){
                loadIndicator
            }
            else{
                ForEach(listViewModel.listViewState.recipeList){ recipe in
                    NavigationLink(
                        destination: DetailView(recipe: recipe),
                        label: {
                            ListItem(recipe: recipe)
                        }
                    )
                    .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                }
                if(listViewModel.listViewState.moreRecipeAvailable){
                    loadIndicator
                        .onAppear{
                            listViewModel.fetchNextPage()
                        }
                }
            }
        }
        .listStyle(InsetListStyle())
    }
    
    var noResultText: some View{
        HStack{
            Spacer()
            Text("No result found...")
            Spacer()
        }
    }
    
    var loadIndicator: some View{
        HStack{
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let mockServiceLoading = MockRecipeService(isLoading: true, moreRecipeAvailable: false)
        let dependency = Dependency(recipeService: mockServiceLoading)
        ListView(dependency: dependency)
    }
}

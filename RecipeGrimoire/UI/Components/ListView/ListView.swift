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
            ForEach(listViewModel.listViewState.recipeList){ recipe in
                NavigationLink(
                    destination: DetailView(recipe: recipe),
                    label: {
                        ListItem(recipe: recipe)
                    }
                )
                .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
        }
        .listStyle(InsetListStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

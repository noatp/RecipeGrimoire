//
//  SearchView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import SwiftUI

struct SearchView: View {
    var searchViewModel: SearchViewModel
    
    init(dependency: Dependency = .preview){
        searchViewModel = dependency.searchViewModel
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                    LiveTextField(dependency: Dependency.shared)
                }
                ListView(dependency: Dependency.shared)
            }
            .padding(.horizontal)
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

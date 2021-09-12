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
                LiveTextField(dependency: Dependency.shared)
                ListView(dependency: Dependency.shared)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

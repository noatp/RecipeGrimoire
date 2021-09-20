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
        VStack(alignment: .leading){
            Image("titleLogo")
                .resizable()
                .padding(.top, 16.0)
                .scaledToFit()
                .frame(width: 150)
            Text("Search")
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack{
                Image(systemName: "magnifyingglass")
                LiveTextField(dependency: Dependency.shared)
            }
            ListView(dependency: Dependency.shared)
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SearchView()
        }
    }
}

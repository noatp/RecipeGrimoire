//
//  AppView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import SwiftUI

struct AppView: View {
    typealias Tab = AppViewModel.Tab
    @ObservedObject var appViewModel: AppViewModel
    
    init(dependency: Dependency = .preview){
        self.appViewModel = dependency.appViewModel
    }
    
    var body: some View {
        TabView(selection: $appViewModel.selectedTab){
            SearchView(dependency: Dependency.shared)
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
                .tag(Tab.search)
            BookmarkView()
                .tabItem { Label("Bookmark", systemImage: "bookmark") }
                .tag(Tab.bookmark)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        return AppView()
    }
}

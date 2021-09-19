//
//  AppViewModel.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import Foundation

class AppViewModel: ObservableObject{
    @Published var selectedTab: Tab = .bookmark
    
    enum Tab{
        case search
        case bookmark
    }
}

extension Dependency{
    var appViewModel: AppViewModel{
        AppViewModel()
    }
}

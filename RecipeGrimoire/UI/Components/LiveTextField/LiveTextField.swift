//
//  LiveTextField.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct LiveTextField: View {
    @ObservedObject var liveTextFieldViewModel: LiveTextFieldViewModel
    
    init(dependency: Dependency = .preview){
        self.liveTextFieldViewModel = dependency.liveTextFieldViewModel
    }
    
    var body: some View {
        TextField("Search", text: $liveTextFieldViewModel.searchTerm)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(10)
            .font(.title2)
    }
}

struct LiveTextField_Previews: PreviewProvider {
    static var previews: some View {
        LiveTextField()
            .previewLayout(.sizeThatFits)
    }
}

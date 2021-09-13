//
//  ContentView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        AppView(dependency: Dependency.shared)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

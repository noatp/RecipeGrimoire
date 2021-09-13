//
//  BookmarkView.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import SwiftUI

struct BookmarkView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var bookmarks: FetchedResults<Bookmark>
    
    var body: some View {
        NavigationView{
            List {
                ForEach(bookmarks) { bookmark in
                    Text("\(bookmark.id)")
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                HStack{
                    #if os(iOS)
                    EditButton()
                    #endif
                    Spacer()
                    Button(action: addItem) {
                        Label("Add Bookmark", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Bookmark")
        }
    }
    
    private func addItem() {
        let newBookmark = Bookmark(context: viewContext)
        newBookmark.id = 1
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { bookmarks[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}

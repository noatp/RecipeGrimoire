//
//  BookmarkService.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import CoreData

class Database{
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RecipeGrimoire")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext{
        Self.persistentContainer.viewContext
    }

    //Publisher
    @Published var bookmarkedRecipeList: [RecipeDTO] = []
    
    init(initBookmarkedRecipeList: [RecipeDTO] = []) {
        self.bookmarkedRecipeList = initBookmarkedRecipeList
    }
    
    //CRUD
    func bookmarkRecipe(recipe: RecipeDTO){
        let _ = recipe.toRecipeEntity()
        do{
            try viewContext.save()
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func getAllBookmarkedRecipe(){
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        do{
            let recipeEntities = try viewContext.fetch(request)
            bookmarkedRecipeList = recipeEntities.toRecipeDTOList()
        } catch {
            print(error)
        }
    }
    
    func isRecipeBookmarked(recipe: RecipeDTO) -> Bool{
//        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
//        request.predicate = NSPredicate(format: "title == %@", recipe.title)
//        let requestResult = (try? viewContext.fetch(request)) ?? []
//        return requestResult.count > 0
        getAllBookmarkedRecipe()
        let bookmark = bookmarkedRecipeList.first { bookmarkedRecipe in
            bookmarkedRecipe.id == recipe.id
        }
        
        if let _ = bookmark{
            return true
        }
        else{
            return false
        }
    }
    
    func removeBookmark(recipe: RecipeDTO){
        var existingBookmark: NSManagedObject
        do{
            existingBookmark = try viewContext.existingObject(with: recipe.bookmarkId!)
        } catch {
            print("Database.removeBookmark: cannot find existing bookmark")
            return
        }
        viewContext.delete(existingBookmark)
        do{
            try viewContext.save()
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
}

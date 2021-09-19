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
    
    //CRUD
    //create
    func bookmarkRecipe(recipe: RecipeDTO){
        let _ = recipe.toRecipeEntity()
        saveViewContext()
//        getAllBookmarkedRecipe()
    }
    
    //read multiple
    func getAllBookmarkedRecipe() -> [RecipeDTO]{
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        do{
            let recipeEntities = try viewContext.fetch(request)
            return recipeEntities.toRecipeDTOList()
        } catch {
            print(error)
        }
        return []
    }
    
    //read single
    func checkIfRecipeIsBookmarked(recipe: RecipeDTO) -> Bool{
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", recipe.title)
        do{
            let recipeEntities = try viewContext.fetch(request)
            if (!recipeEntities.isEmpty){
                return true
            }
        } catch{
            print(error)
        }
        return false
    }
        
    //delete
    func removeBookmark(recipe: RecipeDTO){
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", recipe.title)
        do{
            let recipeEntities = try viewContext.fetch(request)
            recipeEntities.forEach { recipeEntity in
                viewContext.delete(recipeEntity)
            }
        } catch{
            print(error)
        }
        saveViewContext()
//        getAllBookmarkedRecipe()
    }
    
    func saveViewContext(){
        do{
            try viewContext.save()
        } catch{
            viewContext.rollback()
            print("\(#function): \(error.localizedDescription)")
        }
    }
    
}

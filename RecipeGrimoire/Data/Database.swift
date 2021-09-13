//
//  BookmarkService.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/12/21.
//

import Foundation
import CoreData

class Database{
    var persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{
        persistentContainer.viewContext
    }
        
    init() {
        persistentContainer = NSPersistentContainer(name: "RecipeGrimoire")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error{
                fatalError("Unable to init Core Data stack: \(error)")
            }
        }
    }
    
    func bookmarkRecipe(){
        do{
            try viewContext.save()
        } catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func getAllBookmarkedRecipe() -> [Recipe]{
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        do{
            return try recipeEntityListToRecipeListMapper(recipeEntityList: viewContext.fetch(request))
        } catch {
            print(error)
            return []
        }
    }
    
    func removeBookmarkOnRecipe(){
        
    }
    
    func recipeEntityToRecipeMapper(recipeEntity: RecipeEntity) -> Recipe{
        return Recipe(
            id: Int(recipeEntity.id),
            title: recipeEntity.title!,
            publisher: recipeEntity.publisher!,
            featuredImage: recipeEntity.featuredImage!,
            sourceURL: recipeEntity.sourceURL!,
            ingredients: recipeEntity.ingredients!
        )
    }
    
    func recipeEntityListToRecipeListMapper(recipeEntityList: [RecipeEntity]) -> [Recipe]{
        recipeEntityList.map { recipeEntity in
            recipeEntityToRecipeMapper(recipeEntity: recipeEntity)
        }
    }
}

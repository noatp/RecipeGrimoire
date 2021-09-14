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

    
    func bookmarkRecipe(recipe: Recipe){
        let _ = recipeToRecipeEntityMapper(recipe: recipe)
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
            let allBookmarkedRecipe = try recipeEntityListToRecipeListMapper(recipeEntityList: viewContext.fetch(request))
            print("HERE \(allBookmarkedRecipe)")
            return allBookmarkedRecipe
        } catch {
            print("FUCK")
            print(error)
            return []
        }
    }
    
    func isRecipeBookmarked(recipe: Recipe) -> Bool{
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", recipe.title)
        let requestResult = (try? viewContext.fetch(request)) ?? []
        return requestResult.count > 0
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
    
    func recipeToRecipeEntityMapper(recipe: Recipe) -> RecipeEntity{
        let newRecipeEntity = RecipeEntity(context: viewContext)
        newRecipeEntity.id = Int64(recipe.id)
        newRecipeEntity.title = recipe.title
        newRecipeEntity.publisher = recipe.publisher
        newRecipeEntity.featuredImage = recipe.featuredImage
        newRecipeEntity.sourceURL = recipe.sourceURL
        newRecipeEntity.ingredients = recipe.ingredients
        return newRecipeEntity
    }
}

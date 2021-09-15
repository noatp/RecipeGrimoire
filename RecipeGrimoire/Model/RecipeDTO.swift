//
//  RecipeDTO.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/14/21.
//

import Foundation
import CoreData

struct RecipeDTO: Identifiable{
    var id: Int
    var title, publisher, featuredImage, sourceURL: String
    var ingredients: [String]
    var bookmarkId: NSManagedObjectID?
    
    static func fromRecipe(_ recipe: Recipe) -> RecipeDTO{
        return RecipeDTO(
            id: recipe.id,
            title: recipe.title,
            publisher: recipe.publisher,
            featuredImage: recipe.featuredImage,
            sourceURL: recipe.sourceURL,
            ingredients: recipe.ingredients,
            bookmarkId: nil
        )
    }
    
    static func fromRecipeEntity(_ recipeEntity: RecipeEntity) -> RecipeDTO{
        return RecipeDTO(
            id: Int(recipeEntity.id),
            title: recipeEntity.title!,
            publisher: recipeEntity.publisher!,
            featuredImage: recipeEntity.featuredImage!,
            sourceURL: recipeEntity.sourceURL!,
            ingredients: recipeEntity.ingredients!,
            bookmarkId: recipeEntity.objectID
        )
    }
    
    func toRecipeEntity() -> RecipeEntity{
        let newRecipeEntity = RecipeEntity(context: Database.persistentContainer.viewContext)
        newRecipeEntity.id = Int64(self.id)
        newRecipeEntity.title = self.title
        newRecipeEntity.publisher = self.publisher
        newRecipeEntity.featuredImage = self.featuredImage
        newRecipeEntity.sourceURL = self.sourceURL
        newRecipeEntity.ingredients = self.ingredients
        return newRecipeEntity
    }
    
    static let preview = RecipeDTO(
        id: 12,
        title: "Preview Recipe",
        publisher: "Noat",
        featuredImage: "",
        sourceURL: "",
        ingredients: [],
        bookmarkId: NSManagedObjectID()
    )
    
    static let previewList = [preview, preview, preview]
}

extension Collection where Element == Recipe{
    func toRecipeDTOList() -> [RecipeDTO]{
        self.map { recipe in
            RecipeDTO.fromRecipe(recipe)
        }
    }
}

extension Collection where Element == RecipeEntity{
    func toRecipeDTOList() -> [RecipeDTO]{
        self.map { recipeEntity in
            RecipeDTO.fromRecipeEntity(recipeEntity)
        }
    }
}

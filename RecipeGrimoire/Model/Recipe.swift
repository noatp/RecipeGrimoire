//
//  Recipe.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import Foundation

// MARK: - Recipe
struct Recipe: Codable, Identifiable {
    var id: Int?
    var title, publisher: String?
    var featuredImage: String?
    var rating: Int?
    var sourceURL: String?
    var recipeDescription: String?
    var cookingInstructions: [String]?
    var ingredients: [String]?
    var dateAdded, dateUpdated: String?
    var longDateAdded, longDateUpdated: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "pk"
        case title, publisher
        case featuredImage = "featured_image"
        case rating
        case sourceURL = "source_url"
        case recipeDescription = "description"
        case cookingInstructions = "cooking_instructions"
        case ingredients
        case dateAdded = "date_added"
        case dateUpdated = "date_updated"
        case longDateAdded = "long_date_added"
        case longDateUpdated = "long_date_updated"
    }
    
    static let preview = Recipe(id: 12, title: "Preview Recipe", publisher: "Noat", featuredImage: "", rating: 0, sourceURL: "", recipeDescription: "", cookingInstructions: [], ingredients: [], dateAdded: "", dateUpdated: "", longDateAdded: nil, longDateUpdated: nil)
    
    static let previewList = [preview, preview, preview]
}

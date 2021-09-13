//
//  Recipe.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import Foundation

// MARK: - Recipe
struct Recipe: Codable, Identifiable {
    var id: Int
    var title, publisher, featuredImage, sourceURL: String
    var ingredients: [String]

    
    enum CodingKeys: String, CodingKey {
        case id = "pk"
        case title, publisher
        case featuredImage = "featured_image"
        case sourceURL = "source_url"
        case ingredients
    }
    
    static let preview = Recipe(
        id: 583,
        title: "Pizza Potato Skins",
        publisher: "mitch",
        featuredImage: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/583/featured_image.png",
        sourceURL: "http://thepioneerwoman.com/cooking/2013/04/pizza-potato-skins/",
        ingredients: [
            "Canola Oil",
            "Kosher Salt",
            "Butter, Melted",
            "Diced Pepperoni",
            "Minced Fresh Parsley",
            "Grated Mozzarella Cheese",
            "8 whole Small Russet Potatoes",
            "Jarred Marinara Or Pizza Sauce",
            "Miscellaneous Pizza Toppings: Cooked Sausage, Cooked Hamburger, Diced Bell Pepper, Diced Onion, Diced Mushrooms, Diced Canadian Bacon, Etc."
        ]
    )
    static let previewList = [preview, preview, preview]
}

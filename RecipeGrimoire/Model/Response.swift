//
//  Response.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/11/21.
//

import Foundation

struct Response: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Recipe]
}

//
//  RecipeModel.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import Foundation
import Foundation

//let recipe = try? newJSONDecoder().decode(Recipe.self, from: jsonData)

// MARK: - Recipe
class Recipe: Codable {
    let title: String?
    let version: Double?
    let href: String?
    let results: [Result]?

    init(title: String?, version: Double?, href: String?, results: [Result]?) {
        self.title = title
        self.version = version
        self.href = href
        self.results = results
    }
}

// MARK: - Result
class Result: Codable {
    let title: String?
    let href: String?
    let ingredients: String?
    let thumbnail: String?

    init(title: String?, href: String?, ingredients: String?, thumbnail: String?) {
        self.title = title
        self.href = href
        self.ingredients = ingredients
        self.thumbnail = thumbnail
    }
}

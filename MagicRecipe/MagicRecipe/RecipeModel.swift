//
//  RecipeModel.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import Foundation
struct RecipeElement: Codable {
    let title: String?
    let href: String?
    let ingredients: String?
    let thumbnail: String?
}

typealias Recipe = [RecipeElement]


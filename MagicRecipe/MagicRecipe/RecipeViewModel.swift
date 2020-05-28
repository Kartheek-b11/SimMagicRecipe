//
//  RecipeViewModel.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class RecipeViewModel: NSObject {
	
	@IBOutlet var recipeClient :RecipeClient!
	var recipes : [String : Any]? = nil
	func numberOfItemsInSection(section : Int) -> Int{
		return recipes?.count ?? 0
	}
	func titleForRowAtIndexPath(indexPath : NSIndexPath) -> String
	{
		return recipes?[indexPath.row].value(forKey: "title")
	}
	func fetchRecipes(completion: () ->()){
		RecipeClient.fetchRecipe { (recipes) in
			self.recipes = recipes
			completion()
		}
	}
	
}

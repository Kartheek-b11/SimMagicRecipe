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
	var recipeObjects : [RecipeElement] = []
	var ingredients = ""
	var page = 1
	func numberOfItemsInSection(section : Int) -> Int{
		return recipeObjects.count
	}
	func titleForRowAtIndexPath(indexPath : NSIndexPath) -> String
	{
		let recipe = recipeObjects[indexPath.item]
		return recipe.title ?? ""
	}
	func fetchRecipes(completion :@escaping (_ success : Bool) -> Void){
		RecipeClient.fetchRecipe(ingredients: ingredients, page: page) { (recipes) in
			if let finalRecipes = recipes!["results"] as? [[String : String]]{
				let jsonData = self.stringArrayToData(stringArray: finalRecipes)
				let data = try! JSONDecoder().decode(Recipe.self, from: jsonData!)
				self.recipeObjects.append(contentsOf: data)
				completion(true)
			}
		}
	}
	func stringArrayToData(stringArray: [[String : String]]) -> Data? {
	  return try? JSONSerialization.data(withJSONObject: stringArray, options: [])
	}
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return recipes.numberOfItemsInSection(section: section)
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cityCell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as! RecipesTableViewCell
		let recep = recipes.recipeObjects[indexPath.row]
		cityCell.configureCell(viewModel: recep)
		return cityCell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detail = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC")as! DetailsViewController
		detail.recipe = recipes.recipeObjects[indexPath.row]
		self.navigationController?.pushViewController(detail, animated: true)
		
	}
}
extension UIImageView {
    public func imageFromURL(urlString: String) {
		if urlString == ""{
			DispatchQueue.main.async(execute: { () -> Void in
				self.image = UIImage(named:"PlaceHolderImage")
			})
		}else{
			URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
				
				if error != nil {
					print(error ?? "No Error")
					return
				}
				DispatchQueue.main.async(execute: { () -> Void in
					let image = UIImage(data: data!)
					self.image = image
				})
				
			}).resume()
		}
    }
}

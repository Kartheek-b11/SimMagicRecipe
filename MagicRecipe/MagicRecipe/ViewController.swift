//
//  ViewController.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

	@IBOutlet var recipes : RecipeViewModel!
	@IBOutlet var recipeTableView : UITableView!
	@IBOutlet var ingridentTF : UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		recipeTableView.register(UINib(nibName: "RecipesTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipesTableViewCell")
		ingridentTF.text = "onions,garlic"
		loadData()
		
	}
	fileprivate func loadData(isPagging:Bool = false) {
		if !isPagging {
			recipes.recipeObjects = []
		}
		recipes.ingredients = ingridentTF.text ?? ""
		recipes.fetchRecipes { (success) in
			DispatchQueue.main.async {
				self.recipeTableView.reloadData()
			}
			
		}
	}
	
	@IBAction func searchAction(_ sender:UIButton){
		self.view.endEditing(true)
		loadData()
	}
}
extension ViewController:UITextFieldDelegate{
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.searchAction(UIButton())
		return true
	}
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		recipes.page += 1
		loadData(isPagging: true)
	}
}

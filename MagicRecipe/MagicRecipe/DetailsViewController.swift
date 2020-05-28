//
//  DetailsViewController.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

	var recipe : RecipeElement?
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var ingridentsLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		titleLabel.text = recipe?.title ?? ""
		ingridentsLabel.text = recipe?.ingredients ?? ""
		imageView.imageFromURL(urlString: recipe?.thumbnail ?? "")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

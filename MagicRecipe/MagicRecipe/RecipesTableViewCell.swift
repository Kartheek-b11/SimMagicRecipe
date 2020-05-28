//
//  RecipesTableViewCell.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

	@IBOutlet weak var receipeImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	func configureCell(viewModel : RecipeElement){
		self.titleLabel.text = viewModel.title ?? ""
		receipeImageView.imageFromURL(urlString: viewModel.thumbnail ?? "")
	}
    
}

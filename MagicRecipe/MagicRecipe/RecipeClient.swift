//
//  RecipeClient.swift
//  MagicRecipe
//
//  Created by Vebbler Technologies on 28/05/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class RecipeClient: NSObject {
	class func fetchRecipe(ingredients:String,page:Int,completion :@escaping (_ recipes : [String: Any]?) -> Void){
		let urlString = "http://www.recipepuppy.com/api/?i=\(ingredients)&p=\(page)"
		URLSession.shared.dataTask(with: URL(string :urlString)!) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                do {
					let result = try JSONSerialization.jsonObject(with: responseData!, options: []) as? [String:Any]
					_ = result?.index(forKey: "title.results")
					completion(result)
                    return
                }
                catch let error{
                    debugPrint("error occured while JSONSerialization = \(error)")
                }
            }
        }.resume()
	}
}

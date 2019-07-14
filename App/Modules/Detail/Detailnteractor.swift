//
//  Detailnteractor.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class DetailInteractor {

	var output: DetailInteractorOutput!
}

extension DetailInteractor: DetailInteractorInput {

	func loadRecipe(_ recipeId:String) {
		Services.shared.api.getDetail(id: recipeId) { result in
			self.output.didLoadRecipe(result.map { $0.recipe })
		}
	}
}

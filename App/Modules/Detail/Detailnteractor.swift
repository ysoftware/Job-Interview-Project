//
//  Detailnteractor.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {

	private let recipeId:String

	required init(with input:DetailModuleInput) {
		self.recipeId = input.recipeId
	}

	// MARK: - Methods

	func loadRecipe(_ completion: @escaping (Result<Detail, Error>)->Void) {
		Services.shared.api.getDetail(id: recipeId) { result in
			completion(result.map { $0.recipe })
		}
	}
}

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

	required init(recipeId:String) {
		self.recipeId = recipeId
	}
}

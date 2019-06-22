//
//  ListInteractor.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorProtocol {

	weak var presenter:ListPresenterProtocol!

	required init(presenter:ListPresenterProtocol) {
		self.presenter = presenter
	}

	// MARK: - Properties

	private var page = 0

	// MARK: - Methods

	func fetchList(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {

		// to-do check if already loading

		page = 0
		loadMore(completion)
	}

	func loadMore(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
		Service.api.getRecipes(page: page) { result in
			completion(result)
			self.page += 1
		}
	}
}

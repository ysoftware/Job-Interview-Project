//
//  ListInteractor.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorProtocol {

	// MARK: - Properties

	private var page = 1
	private var reachedEnd = false

	// MARK: - Methods

	func fetchList(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {

		// to-do check if already loading

		reachedEnd = false
		page = 1
		loadMore(completion)
	}

	func loadMore(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
		guard !reachedEnd else { return }

		Service.api.getRecipes(page: page) { result in
			completion(result.map { $0.recipes })
			self.page += 1

			if case let .success(response) = result, response.recipes.count < 30 {
				self.reachedEnd = true
			}
			else if case .failure = result {
				self.reachedEnd = true
			}
		}
	}
}

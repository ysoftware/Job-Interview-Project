//
//  ListInteractor.swift
//  Job-Interview
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class ListInteractor {

	// MARK: - Properties

	var output: ListInteractorOutput!

	var apiService: ApiProtocol!

	private var page = 1

	private var reachedEnd = false
}

extension ListInteractor: ListInteractorInput {

	func fetchList() {

		reachedEnd = false
		page = 1
		loadMore(output.didFetchList)
	}

	func loadMore() {
		loadMore(output.didloadMore)
	}

	private func loadMore(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
		guard !reachedEnd else { return }

		apiService.getRecipes(page: page) { result in
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

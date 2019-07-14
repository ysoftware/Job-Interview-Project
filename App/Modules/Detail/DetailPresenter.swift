//
//  DetailPresenter.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class DetailPresenter {

	// MARK: - Properties

	private var recipe:Detail?

	// MARK: - Parts

	weak var view:DetailViewInput!

	var router: DetailRouterInput!

	var interactor: DetailInteractorInput!

	var moduleInput: DetailModuleInput!
}

extension DetailPresenter: DetailViewOutput {

	func didTriggerViewReadyEvent() {
		interactor.loadRecipe(moduleInput.recipeId)
	}

	func didTriggerOpenWebite() {
		if let url = recipe?.publisher_url {
			router.openWebsite(url: url)
		}
	}
}

extension DetailPresenter: DetailInteractorOutput {

	func didLoadRecipe(_ result: Result<Detail, Error>) {
		switch result {
		case .success(let recipe):
			self.recipe = recipe
			self.view.setup(with: recipe)
		case .failure(let error):
			self.view.showError(error.localizedDescription)
		}
	}
}

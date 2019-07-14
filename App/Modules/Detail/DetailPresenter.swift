//
//  DetailPresenter.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {

	// MARK: - Properties

	private weak var view:DetailViewProtocol!

	private let recipeId:String

	private var recipe:Detail?

	var router: DetailRouterProtocol!

	var interactor: DetailInteractorProtocol!

	// MARK: - Init

	required init(with view:DetailViewProtocol, input:DetailModuleInput) {
		self.recipeId = input.recipeId
		self.view = view
	}

	// MARK: - Methods

	func openWebsiteTapped() {
		if let url = recipe?.publisher_url {
			router.openWebsite(url: url)
		}
	}

	func didLoadView() {
		interactor.loadRecipe { result in
			switch result {
			case .success(let recipe):
				self.recipe = recipe
				self.view.setup(with: recipe)
			case .failure(let error):
				self.view.showError(error.localizedDescription)
			}
		}
	}
}

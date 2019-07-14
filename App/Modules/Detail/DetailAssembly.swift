//
//  DetailAssembly.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

struct DetailIdInput: DetailModuleInput {

	let recipeId: String
}

class DetailAssembly {

	func assemble(with input:DetailModuleInput) -> DetailViewProtocol {
		let viewController = R.storyboard.main.detailViewController()!
		let container = Container()

		container.register(DetailInteractorProtocol.self) { _ in
			DetailInteractor(with: input)
		}

		container.register(DetailRouterProtocol.self) { _ in
			DetailRouter(viewController: viewController)
		}

		container.register(DetailPresenterProtocol.self) { _ in
			let presenter = DetailPresenter(with: viewController, input: input)
			presenter.interactor = container.resolve(DetailInteractorProtocol.self)!
			presenter.router = container.resolve(DetailRouterProtocol.self)!
			return presenter
		}

		viewController.presenter = container.resolve(DetailPresenterProtocol.self)!
		return viewController
	}
}

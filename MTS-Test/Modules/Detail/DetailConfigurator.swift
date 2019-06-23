//
//  DetailConfigurator.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class DetailConfigurator {

	func configure(with view: DetailViewController) -> DetailPresenterProtocol {
		let container = Container()

		container.register(DetailInteractorProtocol.self) { _ in
			DetailInteractor()
		}

		container.register(DetailRouterProtocol.self) { _ in
			DetailRouter(viewController: view)
		}

		container.register(DetailPresenterProtocol.self) { _ in
			let presenter = DetailPresenter(with: view)
			presenter.interactor = container.resolve(DetailInteractorProtocol.self)!
			presenter.router = container.resolve(DetailRouterProtocol.self)!
			return presenter
		}

		return container.resolve(DetailPresenterProtocol.self)!
	}
}

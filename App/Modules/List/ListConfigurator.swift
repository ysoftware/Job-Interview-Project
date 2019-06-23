//
//  ListConfigurator.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class ListConfigurator {

	func configure(with view:ListViewController) -> ListPresenterProtocol {
		let container = Container()

		container.register(ListInteractorProtocol.self) { _ in
			ListInteractor()
		}

		container.register(ListRouterProtocol.self) { _ in
			ListRouter(viewController: view)
		}

		container.register(ListPresenterProtocol.self) { _ in
			let presenter = ListPresenter(with: view)
			presenter.interactor = container.resolve(ListInteractorProtocol.self)!
			presenter.router = container.resolve(ListRouterProtocol.self)!
			return presenter
		}

		return container.resolve(ListPresenterProtocol.self)!
	}
}

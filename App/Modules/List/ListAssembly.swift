//
//  ListAssembly.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class ListAssembly {

	func assemble() -> ListViewProtocol {
		let viewController = R.storyboard.main.listViewController()!
		let container = Container()

		container.register(ListInteractorProtocol.self) { _ in
			ListInteractor()
		}

		container.register(ListRouterProtocol.self) { _ in
			ListRouter(viewController: viewController)
		}

		container.register(ListPresenterProtocol.self) { _ in
			let presenter = ListPresenter(with: viewController)
			presenter.interactor = container.resolve(ListInteractorProtocol.self)!
			presenter.router = container.resolve(ListRouterProtocol.self)!
			return presenter
		}

		viewController.presenter = container.resolve(ListPresenterProtocol.self)!
		return viewController
	}
}

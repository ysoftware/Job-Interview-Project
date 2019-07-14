//
//  ListAssembly.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class ListAssembly: Assembly {

	func assemble(container: Container) {
		container.register(ListViewController.self) { _ in
			R.storyboard.main.listViewController()!
		}.initCompleted { resolver, instance in
			instance.presenter = resolver.resolve(ListPresenterProtocol.self)
		}.implements(ListViewProtocol.self)

		container.register(ListInteractorProtocol.self) { _ in
			ListInteractor()
		}.initCompleted { resolver, instance in
			// to-do: move to input/output system
		}.implements(ListInteractorProtocol.self)

		container.register(ListRouter.self) { _ in
			ListRouter()
		}.initCompleted { resolver, instance in
			instance.transitionHandler = resolver.resolve(ListViewController.self)
		}.implements(ListRouterProtocol.self)

		container.register(ListPresenter.self) { _ in
			ListPresenter()
		}.initCompleted { resolver, instance in
			instance.view = resolver.resolve(ListViewController.self)
			instance.interactor = container.resolve(ListInteractorProtocol.self)
			instance.router = container.resolve(ListRouterProtocol.self)
		}.implements(ListPresenterProtocol.self,
					 DetailModuleInput.self)
	}
}

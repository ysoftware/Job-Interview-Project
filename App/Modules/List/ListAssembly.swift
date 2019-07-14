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
		registerView(in: container)
		registerPresenter(in: container)
		registerInteractor(in: container)
		registerRouter(in: container)
	}

	private func registerView(in container: Container) {
		container.register(ListViewController.self) { _ in
			R.storyboard.main.listViewController()!
		}.initCompleted { resolver, instance in
			instance.output = resolver.resolve(ListViewOutput.self)
		}.implements(ListViewInput.self)
	}

	private func registerPresenter(in container: Container) {
		container.register(ListPresenter.self) { container in
			ListPresenter()
		}.initCompleted { resolver, instance in
			instance.router = resolver.resolve(ListRouterInput.self)
			instance.view = resolver.resolve(ListViewInput.self)
			instance.interactor = resolver.resolve(ListInteractorInput.self)
		}.implements(ListViewOutput.self,
					 ListInteractorOutput.self)
	}

	private func registerInteractor(in container: Container) {
		container.register(ListInteractor.self) { _ in
			ListInteractor()
		}.implements(ListInteractorInput.self)
	}

	private func registerRouter(in container: Container) {
		container.register(ListRouter.self) { _ in
			ListRouter()
		}.initCompleted { resolver, instance in
			instance.transitionHandler = resolver.resolve(ListViewController.self)
		}.implements(ListRouterInput.self)
	}
}

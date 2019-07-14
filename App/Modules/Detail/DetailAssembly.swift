//
//  DetailAssembly.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class DetailAssembly: Assembly {

	func assemble(container: Container) {
		registerView(in: container)
		registerPresenter(in: container)
		registerInteractor(in: container)
		registerRouter(in: container)
	}

	private func registerView(in container: Container) {
		container.register(DetailViewController.self) { _ in
			R.storyboard.main.detailViewController()!
		}.initCompleted { resolver, instance in
			instance.output = resolver.resolve(DetailViewOutput.self)
		}.implements(DetailViewInput.self)
	}

	private func registerPresenter(in container: Container) {
		container.register(DetailPresenter.self) { container in
			DetailPresenter()
		}.initCompleted { resolver, instance in
			// to-do: move to input/output system
			instance.moduleInput = resolver.resolve(ListPresenter.self)!
			
			instance.router = resolver.resolve(DetailRouterInput.self)
			instance.view = resolver.resolve(DetailViewInput.self)
			instance.interactor = resolver.resolve(DetailInteractorInput.self)
		}.implements(DetailViewOutput.self,
					 DetailInteractorOutput.self,
					 DetailModuleInput.self)
	}

	private func registerInteractor(in container: Container) {
		container.register(DetailInteractor.self) { _ in
			DetailInteractor()
		}.initCompleted { resolver, instance in
			instance.output = resolver.resolve(DetailInteractorOutput.self)
		}.implements(DetailInteractorInput.self)
	}

	private func registerRouter(in container: Container) {
		container.register(DetailRouter.self) { _ in
			DetailRouter()
		}.initCompleted { resolver, instance in
			instance.transitionHandler = resolver.resolve(DetailViewController.self)
		}.implements(DetailRouterInput.self)
	}
}

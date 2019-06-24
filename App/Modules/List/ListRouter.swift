//
//  ListRouter.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListRouter: ListRouterProtocol {

	private weak var viewController:UIViewController!

	required init(viewController: UIViewController) {
		self.viewController = viewController
	}

	func presentDetail(for recipe:Recipe) {
		let detailVC = R.storyboard.main.detailViewController()!
		detailVC.configureModule(with: recipe.recipe_id)
		detailVC.title = recipe.title
		viewController.show(detailVC, sender: self)
	}
}

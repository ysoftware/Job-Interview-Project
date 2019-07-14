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

	func presentDetail(with input:DetailModuleInput) {
		let detailVC = DetailAssembly().assemble(with: input) as! UIViewController
		viewController.show(detailVC, sender: self)
	}
}

//
//  ListRouter.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListRouter: ListRouterProtocol {

	weak var viewController:UIViewController!

	required init(viewController: UIViewController) {
		self.viewController = viewController
	}

	func presentDetail(at index: Int) {
		let detailVC = R.storyboard.main.detailViewController()!
		viewController.show(detailVC, sender: self)
	}
}

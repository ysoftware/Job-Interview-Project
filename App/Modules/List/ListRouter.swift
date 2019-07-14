//
//  ListRouter.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListRouter: ListRouterProtocol {

	weak var transitionHandler:UIViewController!

	func presentDetail(with input:DetailModuleInput) {
		let detailVC = AppDelegate.instance.container.resolve(DetailViewController.self)!
		transitionHandler.show(detailVC, sender: self)
	}
}

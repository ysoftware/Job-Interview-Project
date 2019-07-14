//
//  ListRouter.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListRouter {

	weak var transitionHandler:UIViewController!
}

extension ListRouter: ListRouterInput {

	func presentDetail(with input:DetailModuleInput) {
		let detailVC = DIAssembler.resolver.resolve(DetailViewController.self)!
		transitionHandler.show(detailVC, sender: self)
	}
}

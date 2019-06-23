//
//  DetailRouter.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit
import SafariServices

class DetailRouter: DetailRouterProtocol {

	weak var viewController:UIViewController!

	required init(viewController: UIViewController) {
		self.viewController = viewController
	}

	func openWebsite(url: String) {
		let safari = SFSafariViewController(url: URL(string: url)!)
		viewController.present(safari, animated: true)
	}
}

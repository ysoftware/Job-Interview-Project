//
//  DetailRouter.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit
import SafariServices

class DetailRouter {

	weak var transitionHandler:UIViewController!
}

extension DetailRouter: DetailRouterInput {

	func openWebsite(url: String) {
		let safari = SFSafariViewController(url: URL(string: url)!)
		transitionHandler.present(safari, animated: true)
	}
}

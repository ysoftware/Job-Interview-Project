//
//  StatusBar.swift
//  JobInterview
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

extension UINavigationController {

	open override var preferredStatusBarStyle: UIStatusBarStyle {
		return topViewController?.preferredStatusBarStyle ?? .default
	}
}

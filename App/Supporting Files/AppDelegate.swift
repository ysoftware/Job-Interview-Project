//
//  AppDelegate.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	let services = Services()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions
		launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let root = window!.rootViewController as! UINavigationController
		root.viewControllers = [ListAssembly().assemble() as! UIViewController]

		return true
	}
}

extension AppDelegate {

	static var instance: AppDelegate {
		return UIApplication.shared.delegate as! AppDelegate
	}
}

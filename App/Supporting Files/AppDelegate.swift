//
//  AppDelegate.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit
import Swinject

// shared container
let container = Container()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions
		launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		registerModules()

		let root = window!.rootViewController as! UINavigationController
		root.viewControllers = [container.resolve(ListViewController.self)!]

		return true
	}
}

extension AppDelegate {

	func registerModules() {
		ListAssembly().assemble(container: container)
		DetailAssembly().assemble(container: container)
		ApiAssembly().assemble(container: container)
	}
}

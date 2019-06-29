//
//  Service.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class Services {

	static var shared: Services {
		return AppDelegate.instance.services
	}

	let api:ApiProtocol = {

		let assembly:ApiAssemblyProtocol = ApiAssembly()
		return assembly.assemble()
	}()
}

//
//  ApiAssembly.swift
//  Job-Interview
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class ApiAssembly: Assembly {

	func assemble(container: Container) {
		container.register(NetworkProtocol.self) { _ in AlamofireNetwork() }
		container.register(ParserProtocol.self) { _ in JSONParser() }
		container.register(CacheProtocol.self) { _ in RealmCache() }

		container.register(ApiProtocol.self) { r in
			Api(network: r.resolve(NetworkProtocol.self)!,
				parser: r.resolve(ParserProtocol.self)!,
				cache: r.resolve(CacheProtocol.self)!)
		}
	}
}

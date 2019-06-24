//
//  ApiAssembly.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

protocol ApiAssemblyProtocol {

	func assemble() -> ApiProtocol
}

class ApiAssembly: ApiAssemblyProtocol {

	func assemble() -> ApiProtocol {
		let container = Container()

		container.register(NetworkProtocol.self) { _ in AlamofireNetwork() }
		container.register(ParserProtocol.self) { _ in JSONParser() }
		container.register(CacheProtocol.self) { _ in RealmCache() }

		container.register(ApiProtocol.self) { r in
			Api(network: r.resolve(NetworkProtocol.self)!,
				parser: r.resolve(ParserProtocol.self)!,
				cache: r.resolve(CacheProtocol.self)!)
		}

		return container.resolve(ApiProtocol.self)!
	}
}

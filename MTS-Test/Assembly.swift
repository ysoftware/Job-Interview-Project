//
//  Assembly.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

let container: Container = {

	let c = Container()

	c.register(NetworkProtocol.self) { _ in Network() }
	c.register(ParserProtocol.self) { _ in JSONParser() }
	c.register(CacheProtocol.self) { _ in Cache() }

	c.register(ApiProtocol.self) { r in
		return Api(network: r.resolve(NetworkProtocol.self)!,
				   parser: r.resolve(ParserProtocol.self)!,
				   cache: r.resolve(CacheProtocol.self)!)
	}

	return c
}()

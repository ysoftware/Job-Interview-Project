//
//  Assembler.swift
//  JobInterview
//
//  Created by ysoftware on 14/07/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Swinject

class DIAssembler {

	static var assembler:Assembler = {
		let root = Assembler()
		root.apply(assembly: ListAssembly())
		root.apply(assembly: DetailAssembly())
		root.apply(assembly: ApiAssembly())
		return root
	}()

	static var resolver: Resolver = {
		return assembler.resolver
	}()
}

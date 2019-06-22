//
//  ListProtocols.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

protocol ListAssemblyProtocol {

	// we have to use a specific view controller for routing purposes
	// maybe it would be better to make a shared router for all modules
	// instead of breaking dependency inversion principle
	func assemble(with view:ListViewController) -> ListPresenterProtocol
}

protocol ListViewProtocol: class {
	
}

protocol ListPresenterProtocol: class {

	var router: ListRouterProtocol! { get set }

	func configureView()
}

protocol ListInteractorProtocol: class {

	func fetchList(_ completion: @escaping (Result<[Recipe], Error>) -> Void)
}

protocol ListRouterProtocol: class {

	func presentDetail(at index: Int)
}

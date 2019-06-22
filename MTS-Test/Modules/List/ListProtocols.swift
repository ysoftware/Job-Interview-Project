//
//  ListProtocols.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

protocol ListAssemblyProtocol {

	// we have to use a specific view controller for routing purposes
	// maybe it would be better to make a shared router for all modules
	// instead of breaking dependency inversion principle
	func assemble(with view:ListViewController) -> ListPresenterProtocol
}

protocol ListViewProtocol: class {

	func showLoading()

	func showEmptyList()

	func showError(_ error:Error)

	func show(_ data: [Recipe])

	func showMore(_ data: [Recipe])
}

protocol ListPresenterProtocol: class {

	var router: ListRouterProtocol! { get set }

	func didScrollToLastCell()

	func didLoadView()

	func didTapElement(_ index:Int)
}

protocol ListInteractorProtocol: class {

	func fetchList(_ completion: @escaping (Result<[Recipe], Error>) -> Void)

	func loadMore(_ completion: @escaping (Result<[Recipe], Error>) -> Void)
}

protocol ListRouterProtocol: class {

	func presentDetail(at index: Int)
}

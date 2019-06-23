//
//  ListProtocols.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

protocol ListViewProtocol: class {

	var tableView:UITableView! { get }

	func showLoading()

	func showEmptyList()

	func showError(_ error:Error)

	func showData()

	func setDataSource(_ dataSource: UITableViewDataSource)
}

protocol ListPresenterProtocol: class {

	var router: ListRouterProtocol! { get set }

	func didScrollToLastCell()

	func didLoadView()

	func didTapElement(_ index:Int)

	func didTapTryAgain()
}

protocol ListInteractorProtocol: class {

	func fetchList(_ completion: @escaping (Result<[Recipe], Error>) -> Void)

	func loadMore(_ completion: @escaping (Result<[Recipe], Error>) -> Void)
}

protocol ListRouterProtocol: class {

	func presentDetail(at index: Int)
}

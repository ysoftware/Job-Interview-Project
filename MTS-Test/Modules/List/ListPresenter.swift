//
//  ListPresenter.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListPresenter: ListPresenterProtocol {

	// MARK: - Properties

	private var dataSource:ListDataSourceProtocol!

	private weak var view:ListViewProtocol!

	var router: ListRouterProtocol!

	var interactor: ListInteractorProtocol!

	// MARK: - Init

	required init(with view:ListViewProtocol) {
		self.view = view
	}

	// MARK: - Methods

	func didLoadView() {

		let ds = ListDataSource(tableView: view.tableView)
		dataSource = ds
		view.setDataSource(ds)

		interactor.fetchList { result in
			do {
				let data = try result.get()
				if data.isEmpty {
					self.view.showEmptyList()
				}
				else {
					self.view.showData()
					self.dataSource.set(data)
				}
			}
			catch {
				self.view.showError(error)
			}
		}
	}

	func didScrollToLastCell() {

		interactor.loadMore { result in
			do {
				let data = try result.get()
				self.dataSource.append(data)
			}
			catch {
				// show pagination error?
			}
		}
	}

	func didTapElement(_ index: Int) {
		router.presentDetail(at: index)
	}

	private func show(_ data: [Recipe]) {
		dataSource.set(data)
	}

	private func showMore(_ data: [Recipe]) {
		dataSource.append(data)
	}
}

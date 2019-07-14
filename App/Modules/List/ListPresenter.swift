//
//  ListPresenter.swift
//  Job-Interview
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListPresenter {

	// MARK: - Properties

	private var dataSource:ListDataSourceProtocol!

	weak var view:ListViewInput!

	var router: ListRouterInput!

	var interactor: ListInteractorInput!

	private var selectedRecipe:Recipe?
}

extension ListPresenter: ListInteractorOutput {

	func didFetchList(_ result: Result<[Recipe], Error>) {
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

	func didloadMore(_ result: Result<[Recipe], Error>) {
		do {
			let data = try result.get()
			self.dataSource.append(data)
		}
		catch {
			// show pagination error?
		}
	}
}

extension ListPresenter: ListViewOutput {

	func didTriggerViewReadyEvent() {
		let ds = ListDataSource(tableView: view.tableView, presenter: self)
		dataSource = ds
		view.setDataSource(ds)
		reloadList()
	}

	func didTriggerElement(_ index: Int) {
		selectedRecipe = dataSource.getRecipe(at: index)
		router.presentDetail(with: self)
	}

	func didTriggerTryAgain() {
		reloadList()
	}

	func didShowLastCell() {
		loadMore()
	}

	func didTriggerRefresh() {
		reloadList()
	}

	private func reloadList() {
		interactor.fetchList()
	}

	private func loadMore() {
		interactor.loadMore()
	}

	private func show(_ data: [Recipe]) {
		dataSource.set(data)
	}

	private func showMore(_ data: [Recipe]) {
		dataSource.append(data)
	}
}

extension ListPresenter: DetailModuleInput {

	var recipeId: String {
		return selectedRecipe?.recipe_id ?? ""
	}
}

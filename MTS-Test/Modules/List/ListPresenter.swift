//
//  ListPresenter.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

class ListPresenter: ListPresenterProtocol {

	// MARK: - Properties

	weak var view:ListViewProtocol!

	var router: ListRouterProtocol!

	var interactor: ListInteractorProtocol!

	// MARK: - Init

	required init(with view:ListViewProtocol) {
		self.view = view
	}

	// MARK: - Methods

	func configureView() {

		interactor.fetchList { result in

		}
	}
}

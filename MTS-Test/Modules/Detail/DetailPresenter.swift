//
//  DetailPresenter.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {

	// MARK: - Properties

	private weak var view:DetailViewProtocol!

	var router: DetailRouterProtocol!

	var interactor: DetailInteractorProtocol!

	// MARK: - Init

	required init(with view:DetailViewProtocol) {
		self.view = view
	}

	// MARK: - Methods

}

//
//  DetailViewController.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

	// MARK: - Outlets

	// MARK: - Properties

	private var presenter:DetailPresenterProtocol!

	// MARK: - Init

	override func viewDidLoad() {
		super.viewDidLoad()


	}

	func configureModule(with recipeId:String) {
		presenter = DetailConfigurator().configure(with: self, recipeId: recipeId)
		presenter.didLoadView()
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}

extension DetailViewController: DetailViewProtocol {

}

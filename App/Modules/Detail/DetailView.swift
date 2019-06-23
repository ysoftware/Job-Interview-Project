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

	@IBOutlet weak var recipeImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var stepsLabel: UILabel!

	@IBOutlet weak var errorLabel: UILabel!
	@IBOutlet weak var errorView: UIView!

	// MARK: - Properties

	private var presenter:DetailPresenterProtocol!

	// MARK: - Init

	override func viewDidLoad() {
		super.viewDidLoad()

		presenter.didLoadView()
	}

	func configureModule(with recipeId:String) {
		presenter = DetailConfigurator().configure(with: self, recipeId: recipeId)
	}

	@IBAction func openWebsiteTapped(_ sender: Any) {
		presenter.openWebsiteTapped()
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}

extension DetailViewController: DetailViewProtocol {

	func showError(_ message:String) {
		errorView.isHidden = false
		errorLabel.text = message
	}

	func setup(with recipe: Detail) {
		errorView.isHidden = true
		titleLabel.text = recipe.publisher
		stepsLabel.text = recipe.ingredients.joined(separator: "\n")

		if let url = URL(string: recipe.image_url) {
			recipeImageView.af_setImage(withURL: url)
		}
	}
}

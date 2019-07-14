//
//  ListDataSource.swift
//  Job-Interview
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit
import AlamofireImage

protocol ListDataSourceProtocol {

	func getRecipe(at index:Int) -> Recipe

	func set(_ data: [Recipe])

	func append(_ data:[Recipe])
}

class ListDataSource: NSObject, UITableViewDataSource, ListDataSourceProtocol {

	// MARK: - Properties

	private weak var presenter:ListPresenter!

	private var array:[Recipe] = []

	private var tableView: UITableView!

	// MARK: - Init

	required init(tableView: UITableView, presenter:ListPresenter) {
		super.init()
		self.tableView = tableView
		tableView.dataSource = self

		tableView.register(UINib(resource: R.nib.listCell),
						   forCellReuseIdentifier: R.reuseIdentifier.listCell.identifier)
	}

	// MARK: - Data Source

	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return array.count
	}

	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let recipe = array[indexPath.row]
		let cell = tableView.dequeueReusableCell(
			withIdentifier: R.reuseIdentifier.listCell, for: indexPath)!

		cell.titleLabel.text = recipe.title
		cell.publisherLabel.text = recipe.publisher

		cell.recipeImageView.image = nil
		if let url = URL(string: recipe.image_url) {
			cell.recipeImageView.af_setImage(withURL: url)
		}

		if indexPath.row == array.count-1 {
			presenter.didShowLastCell()
		}

		return cell
	}

	// MARK: - Methods

	func getRecipe(at index:Int) -> Recipe {
		return array[index]
	}

	func set(_ data: [Recipe]) {
		array = data
		tableView.reloadData()
	}

	func append(_ data:[Recipe]) {
		array.append(contentsOf: data)
		tableView.reloadData()
	}
}

//
//  ListDataSource.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol ListDataSourceProtocol {

	func set(_ data: [Recipe])

	func append(_ data:[Recipe])
}

class ListDataSource: NSObject, UITableViewDataSource, ListDataSourceProtocol {

	private var array:[Recipe] = []
	private var tableView: UITableView!

	required init(tableView: UITableView) {
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
		Alamofire.request(recipe.image_url).responseImage { response in
			if let image = response.result.value {
				cell.recipeImageView.image = image
			}
		}

		return cell
	}

	// MARK: - Methods

	func set(_ data: [Recipe]) {
		array = data
		tableView.reloadData()
	}

	func append(_ data:[Recipe]) {
		array.append(contentsOf: data)
		tableView.reloadData()
	}
}

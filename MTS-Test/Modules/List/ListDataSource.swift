//
//  ListDataSource.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

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
	}

	// MARK: - Data Source

	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return array.count
	}

	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}

	// MARK: - Methods

	func set(_ data: [Recipe]) {
		array = []
		tableView.reloadData()
	}

	func append(_ data:[Recipe]) {
		array.append(contentsOf: data)
		tableView.reloadData()
	}
}

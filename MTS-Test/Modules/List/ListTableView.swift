//
//  ListTableView.swift
//  MTS-Test
//
//  Created by ysoftware on 22/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

class ListDataSource: NSObject, UITableViewDataSource {

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

	func append(_ data:[Recipe]) {
		array.append(contentsOf: data)
		tableView.reloadData()
	}
}

class ListTableDelegate:NSObject, UITableViewDelegate {

	var elementTapped:((_ index:Int)->Void)?

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		elementTapped?(indexPath.row)
	}
}

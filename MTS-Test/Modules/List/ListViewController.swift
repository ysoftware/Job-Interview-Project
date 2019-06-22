//
//  ListViewController.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

	// MARK: - Outlets

	@IBOutlet weak var tableView: UITableView!

	// MARK: - Properties

	private let assembly: ListAssemblyProtocol = ListAssembly()
	private var presenter: ListPresenterProtocol!
	private var dataSource:ListDataSource!
	private var tableDelegate:ListTableDelegate!

	override func viewDidLoad() {
		super.viewDidLoad()

		// module entry point
		presenter = assembly.assemble(with: self)
		presenter.didLoadView()

		tableView.delegate = tableDelegate
		tableDelegate.elementTapped = elementTapped
	}

	private func elementTapped(_ index:Int) {
		presenter.didTapElement(index)
	}
}

extension ListViewController: ListViewProtocol {

	func showLoading() {

	}

	func showEmptyList() {

	}

	func showError(_ error: Error) {

	}

	func showMore(_ data: [Recipe]) {
		dataSource.append(data)
	}

	func show(_ data: [Recipe]) {
		dataSource = ListDataSource(tableView: tableView)
	}
}

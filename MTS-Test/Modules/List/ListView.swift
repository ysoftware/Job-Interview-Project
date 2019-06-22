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

	private var presenter: ListPresenterProtocol!
	private var tableDelegate:ListTableDelegate!

	override func viewDidLoad() {
		super.viewDidLoad()

		// module entry point
		presenter = ListConfigurator().configure(with: self)
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

	func showData() {
		
	}

	func setDataSource(_ dataSource: UITableViewDataSource) {
		tableView.dataSource = dataSource
	}
}

class ListTableDelegate:NSObject, UITableViewDelegate {

	var elementTapped:((_ index:Int)->Void)?

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		elementTapped?(indexPath.row)
	}
}

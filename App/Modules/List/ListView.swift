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

	@IBOutlet weak var errorView: UIView!
	@IBOutlet weak var errorLabel: UILabel!

	@IBOutlet weak var loadingView: UIView!
	@IBOutlet weak var tableView: UITableView!

	// MARK: - Properties

	var presenter: ListPresenter!

	var output: ListViewOutput!

	private let tableDelegate = ListTableDelegate()

	// MARK: - Init

	override func viewDidLoad() {
		super.viewDidLoad()

		configureTableView()
		addRefreshControl()
		presenter.didTriggerViewReadyEvent()
	}

	private func configureTableView() {
		tableDelegate.elementTapped = elementTapped
		tableView.delegate = tableDelegate
	}

	private func addRefreshControl() {
		tableView.refreshControl = UIRefreshControl()
		tableView.refreshControl?.addTarget(self, action: #selector(refresh),
											for: .valueChanged)
	}

	// MARK: - Actions

	@objc func refresh() {
		presenter.didTriggerRefresh()
	}

	@IBAction func tryAgainTapped(_ sender: Any) {
		presenter.didTriggerTryAgain()
	}

	private func elementTapped(_ index:Int) {
		presenter.didTriggerElement(index)
	}

	// MARK: - Appearance

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}

extension ListViewController: ListViewInput {

	func showLoading() {
		loadingView.isHidden = false
		errorView.isHidden = true
		tableView.isHidden = true
		tableView.refreshControl?.endRefreshing()
	}

	func showEmptyList() {
		errorView.isHidden = false
		errorLabel.text = "Нет рецептов"
		loadingView.isHidden = true
		tableView.isHidden = true
		tableView.refreshControl?.endRefreshing()
	}

	func showError(_ error: Error) {
		errorView.isHidden = false
		errorLabel.text = error.localizedDescription
		loadingView.isHidden = true
		tableView.isHidden = true
		tableView.refreshControl?.endRefreshing()
	}

	func showData() {
		tableView.isHidden = false
		errorView.isHidden = true
		loadingView.isHidden = true
		tableView.refreshControl?.endRefreshing()
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

//
//  ListProtocols.swift
//  Job-Interview
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

protocol ListViewInput: class {

	var tableView:UITableView! { get }

	func showLoading()

	func showEmptyList()

	func showError(_ error:Error)

	func showData()

	func setDataSource(_ dataSource: UITableViewDataSource)
}

protocol ListViewOutput: class {

	func didTriggerViewReadyEvent()

	func didTriggerElement(_ index:Int)

	func didTriggerTryAgain()

	func didShowLastCell()
	
	func didTriggerRefresh()
}

protocol ListInteractorInput: class {

	func fetchList()

	func loadMore()
}

protocol ListInteractorOutput: class {

	func didFetchList(_ result: Result<[Recipe], Error>)

	func didloadMore(_ result: Result<[Recipe], Error>)
}

protocol ListRouterInput: class {

	func presentDetail(with input:DetailModuleInput)
}

//
//  ListViewController.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController, ListViewProtocol {

	private let assembly: ListAssemblyProtocol = ListAssembly()
	private var presenter: ListPresenterProtocol!

	override func viewDidLoad() {
		super.viewDidLoad()

		// module entry point
		presenter = assembly.assemble(with: self)
		presenter.configureView()
	}
}

//
//  DetailProtocols.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

protocol DetailModuleInput {

	var recipeId:String { get }
}

protocol DetailViewProtocol: class {

	func setup(with recipe:Detail)

	func showError(_ message:String)
}

protocol DetailPresenterProtocol: class {

	var router: DetailRouterProtocol! { get set }

	var interactor: DetailInteractorProtocol! { get set }

	func didLoadView()

	func openWebsiteTapped()
}

protocol DetailInteractorProtocol: class {

	func loadRecipe(_ completion: @escaping (Result<Detail, Error>)->Void)
}

protocol DetailRouterProtocol: class {

	func openWebsite(url:String)
}

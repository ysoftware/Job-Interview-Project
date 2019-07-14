//
//  DetailProtocols.swift
//  Job-Interview
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import UIKit

protocol DetailModuleInput {

	var recipeId:String { get }
}

protocol DetailViewOutput: class {

	func didTriggerViewReadyEvent()

	func didTriggerOpenWebite()
}

protocol DetailViewInput: class {

	func setup(with recipe:Detail)

	func showError(_ message:String)
}

protocol DetailInteractorInput: class {

	func loadRecipe(_ recipeId:String)
}

protocol DetailInteractorOutput: class {

	func didLoadRecipe(_ result: Result<Detail, Error>)
}

protocol DetailRouterInput: class {

	func openWebsite(url:String)
}

//
//  DetailProtocols.swift
//  MTS-Test
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {

}

protocol DetailPresenterProtocol: class {

	var router: DetailRouterProtocol! { get set }

	var interactor: DetailInteractorProtocol! { get set }
}

protocol DetailInteractorProtocol: class {

}

protocol DetailRouterProtocol: class {

}

//
//  ResponseModel.swift
//  Job-Interview
//
//  Created by ysoftware on 23/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

struct ListResponse: Decodable {

	let recipes: [Recipe]
}

struct DetailResponse: Decodable {

	let recipe: Detail
}

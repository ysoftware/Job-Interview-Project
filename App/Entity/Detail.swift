//
//  Detail.swift
//  Job-Interview
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation
import RealmSwift

final class Detail: Object, Decodable {

	@objc dynamic var publisher = ""

	@objc dynamic var source_url = ""

	@objc dynamic var recipe_id = ""

	@objc dynamic var image_url = ""

	@objc dynamic var title = ""

	@objc dynamic var publisher_url = ""

	@objc dynamic var social_rank = 0.0

	// to-do why not @objc dynamic?
	var ingredients = List<String>()

	override static func primaryKey() -> String? {
		return "recipe_id"
	}
}

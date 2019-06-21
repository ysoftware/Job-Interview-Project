//
//  Recipe.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation
import RealmSwift

final class Recipe: Object, Decodable {

	@objc dynamic var publisher = ""

	@objc dynamic var recipe_id = ""

	@objc dynamic var image_url = ""

	@objc dynamic var social_rank = 0.0
}

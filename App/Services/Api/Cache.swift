//
//  Cache.swift
//  MTS-Test
//
//  Created by ysoftware on 21/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import RealmSwift

protocol CacheProtocol {

	func save(detail:Detail)

	func retrieve(detailWithId id:String) -> Detail?

	func save(recipes:[Recipe], for request:String)

	func retrieve(recipesFor request:String) -> [Recipe]?
}

class RealmCache: CacheProtocol {

	private let realm = try! Realm()

	func save(detail:Detail) {
		try! realm.write {
			self.realm.add(detail, update: .modified)
		}
	}

	func retrieve(detailWithId id:String) -> Detail? {
		return realm.objects(Detail.self).filter { $0.recipe_id == id }.first
	}

	func save(recipes:[Recipe], for request:String) {
		try! realm.write {
			let list = RecipeList()
			list.request = request
			list.recipes.append(objectsIn: recipes)
			realm.add(list, update: .all)
		}
	}

	func retrieve(recipesFor request:String) -> [Recipe]? {
		return realm.objects(RecipeList.self)
			.filter { $0.request == request }
			.first?.recipes.map { $0 }
	}
}

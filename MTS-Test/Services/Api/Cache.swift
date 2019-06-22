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

	func save(recipes:[Recipe], on page:Int)

	func retrieve(recipesAt page:Int) -> [Recipe]?
}

class RealmCache: CacheProtocol {

	private let realm = try! Realm()

	func save(detail:Detail) {
		try! realm.write {
			self.realm.add(detail, update: .modified)
		}
	}

	func retrieve(detailWithId id:String) -> Detail? {
		return realm.objects(Detail.self)
			.filter { $0.recipe_id == id }.first
	}

	func save(recipes:[Recipe], on page:Int) {
		try! realm.write {
			let list = RecipeList()
			list.page = page
			list.recipes.append(objectsIn: recipes)
			realm.add(list, update: .all)
		}
	}

	func retrieve(recipesAt page:Int) -> [Recipe]? {
//		return realm.objects(RecipeList.self)
//			.filter { $0.page == page }
//			.first?.recipes
		return nil
	}
}

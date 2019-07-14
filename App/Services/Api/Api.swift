//
//  Api.swift
//  Job-Interview
//
//  Created by ysoftware on 21/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

protocol ApiProtocol {

	var network:NetworkProtocol { get set }

	var parser:ParserProtocol { get set }

	var cache:CacheProtocol? { get set }

	func getRecipes(page:Int, completion: @escaping (Result<ListResponse, Error>) -> Void)

	func getDetail(id:String, completion: @escaping (Result<DetailResponse, Error>) -> Void)
}

class Api: ApiProtocol {

	private let apiKey = "5a57fc7f803decb006237cd7abe3a22a"

	internal var network:NetworkProtocol
	internal var parser:ParserProtocol
	internal var cache:CacheProtocol?

	required init(network:NetworkProtocol,
				  parser:ParserProtocol,
				  cache: CacheProtocol? = nil) {
		self.network = network
		self.parser = parser
		self.cache = cache
	}

	private func get<T:Decodable>(_ url: String,
						  _ completion: @escaping (Result<T, Error>) -> Void) {
		network.get(url: url) { result in
			do {
				let data = try result.get()
				completion(self.parser.parse(data))
			}
			catch {
				completion(.failure(error))
			}
		}
	}

	func getRecipes(page:Int,
					completion: @escaping (Result<ListResponse, Error>) -> Void) {
//		let url = "http://ysoftware.ru/food/search\(page).json"
		let url = "https://www.food2fork.com/api/search?key=\(apiKey)&page=\(page)"

		get(url) { (result:Result<ListResponse, Error>) in

			if case .failure = result, let cached = self.cache?.retrieve(recipesFor: url) {
				completion(.success(ListResponse(recipes: cached)))
			}
			else {
				completion(result)

				if let data = try? result.get() {
					self.cache?.save(recipes: data.recipes, for: url)
				}
			}
		}
	}

	func getDetail(id:String,
				   completion: @escaping (Result<DetailResponse, Error>) -> Void) {
//		let url = "http://ysoftware.ru/food/get\(id).json"
		let url = "https://www.food2fork.com/api/get?key=\(apiKey)&rId=\(id)"

		get(url) { (result:Result<DetailResponse, Error>) in

			if case .failure = result, let cached = self.cache?.retrieve(detailWithId: id) {
				completion(.success(DetailResponse(recipe: cached)))
			}
			else {
				completion(result)

				if let data = try? result.get() {
					self.cache?.save(detail: data.recipe)
				}
			}
		}
	}
}

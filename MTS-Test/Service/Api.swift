//
//  Api.swift
//  MTS-Test
//
//  Created by ysoftware on 21/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Foundation

protocol ApiProtocol {

	var network:NetworkProtocol { get set }

	var parser:ParserProtocol { get set }

	var cache:CacheProtocol? { get set }

	func getRecipes(page:Int, completion: @escaping (Result<[Recipe], Error>) -> Void)

	func getDetail(id:Int, completion: @escaping (Result<Detail, Error>) -> Void)
}

class Api: ApiProtocol {

	var network:NetworkProtocol
	var cache:CacheProtocol?
	var parser:ParserProtocol

	required init(network:NetworkProtocol,
				  parser:ParserProtocol,
				  cache: CacheProtocol?) {
		self.network = network
		self.parser = parser
		self.cache = cache
	}

	func get<T:Decodable>(_ url: String,
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
					completion: @escaping (Result<[Recipe], Error>) -> Void) {
		get("", completion)
	}

	func getDetail(id:Int,
				   completion: @escaping (Result<Detail, Error>) -> Void) {
		get("", completion)
	}
}

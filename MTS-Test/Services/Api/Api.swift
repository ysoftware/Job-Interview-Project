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

	func getRecipes(page:Int, completion: @escaping (Result<ListResponse, Error>) -> Void)

	func getDetail(id:Int, completion: @escaping (Result<DetailResponse, Error>) -> Void)
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
		get("https://www.food2fork.com/api/search?key=\(apiKey)", completion)
	}

	func getDetail(id:Int,
				   completion: @escaping (Result<DetailResponse, Error>) -> Void) {
		get("https://www.food2fork.com/api/get?key=\(apiKey)&rId=\(id)", completion)
	}
}

//
//  Network.swift
//  MTS-Test
//
//  Created by ysoftware on 20/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Alamofire

protocol NetworkProtocol {

	func get(url:String, completion: @escaping (Swift.Result<Data, Error>)->Void)
}

class Network: NetworkProtocol {

	func get(url: String, completion: @escaping (Swift.Result<Data, Error>) -> Void) {
		Alamofire.SessionManager.default.requestWithoutCache(url).responseData { response in
			switch response.result {
			case .success(let value): completion(.success(value))
			case .failure(let error): completion(.failure(error))
			}
		}
	}
}

extension Alamofire.SessionManager{
	@discardableResult
	open func requestWithoutCache(
		_ url: URLConvertible,
		method: HTTPMethod = .get,
		parameters: Parameters? = nil,
		encoding: ParameterEncoding = URLEncoding.default,
		headers: HTTPHeaders? = nil)// also you can add URLRequest.CachePolicy here as parameter
		-> DataRequest
	{
		do {
			var urlRequest = try URLRequest(url: url, method: method, headers: headers)
			urlRequest.cachePolicy = .reloadIgnoringCacheData // <<== Cache disabled
			let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
			return request(encodedURLRequest)
		} catch {
			// TODO: find a better way to handle error
			print(error)
			return request(URLRequest(url: URL(string: "http://example.com/wrong_request")!))
		}
	}
}

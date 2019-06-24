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

class AlamofireNetwork: NetworkProtocol {

	func get(url: String, completion: @escaping (Swift.Result<Data, Error>) -> Void) {
		Alamofire.request(url).responseData { response in
			switch response.result {
			case .success(let value): completion(.success(value))
			case .failure(let error): completion(.failure(error))
			}
		}
	}
}

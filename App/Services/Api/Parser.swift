//
//  Parser.swift
//  Job-Interview
//
//  Created by ysoftware on 21/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import Alamofire

protocol ParserProtocol {

	func parse<T:Decodable>(_ data:Data) -> Swift.Result<T, Error>
}

class JSONParser: ParserProtocol {

	func parse<T>(_ data: Data) -> Swift.Result<T, Error>
		where T : Decodable {

			do { return .success(try JSONDecoder().decode(T.self, from: data)) }
			catch { return .failure(error) }
	}
}

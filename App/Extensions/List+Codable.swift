
//
//  List+Codable.swift
//  Job-Interview
//
//  Created by ysoftware on 21/06/2019.
//  Copyright © 2019 Ysoftware. All rights reserved.
//

import RealmSwift

extension List : Decodable where Element : Decodable {
	public convenience init(from decoder: Decoder) throws {
		self.init()
		var container = try decoder.unkeyedContainer()
		while !container.isAtEnd {
			let element = try container.decode(Element.self)
			self.append(element)
		}
	} }

extension List : Encodable where Element : Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.unkeyedContainer()
		for element in self {
			try element.encode(to: container.superEncoder())
		}
	} }

//
//  Codable+Extension.swift
//  ModelJSONObjectConvert
//
//  Created by knightyao on 2018/5/4.
//  Copyright © 2018年 knightyao. All rights reserved.
//

import Foundation

extension Encodable {
    subscript(key: String) -> Any? {
        return toDictionary[key]
    }
    var toJsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    var toDictionary: [String: Any] {
        guard let data = toJsonData else {return [:]}
        return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] ?? [:]
    }
    var toJsonStr: String? {
        guard let data = toJsonData else {return nil}
        return String(data: data, encoding: .utf8)
    }
}

extension Decodable {
    static func getModel(data: Data) -> Self? {
        return try? JSONDecoder().decode(self, from: data)
    }
    static func getModel(jsonStr: String) -> Self? {
        guard let data = jsonStr.data(using: .utf8) else {return nil}
        return try? JSONDecoder().decode(self, from: data)
    }
}

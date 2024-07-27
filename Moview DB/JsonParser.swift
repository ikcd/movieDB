//
//  JsonParser.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import Foundation


class JsonParser {
    func jsonParser() -> [MovieDbModel?] {
        var jsonObject : [[String: Any]] = []
        var parsedData = [MovieDbModel]()
        do {
            if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] ?? []
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                    parsedData = try JSONDecoder().decode([MovieDbModel].self, from: jsonData)
                    return parsedData
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        return []
    }
}

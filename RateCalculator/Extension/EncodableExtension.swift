//
//  EncodableExtension.swift
//  RateCalculator
//
//  Created by Bowie Tso on 26/1/2022.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return nil
        }
        return dictionary
    }
}

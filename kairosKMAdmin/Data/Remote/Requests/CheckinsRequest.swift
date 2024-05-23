//
//  CheckinsRequest.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 11/5/24.
//

import Foundation

struct CheckinsRequest: Codable {
    var group: String
    var day: String

    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
        return jsonObject
    }
}

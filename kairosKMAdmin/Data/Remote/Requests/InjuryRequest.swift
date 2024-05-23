//
//  InjuryRequest.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import Foundation

struct InjuryRequest: Codable {
    var type: String
    var userId: String
    var description: String

    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
        return jsonObject
    }
}

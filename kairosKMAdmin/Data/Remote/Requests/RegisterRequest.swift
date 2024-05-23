//
//  RegisterRequest.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 27/11/23.
//

import Foundation

struct RegisterRequest: Codable {
    var firstName: String
    var firstSurname: String
    var secondSurname: String
    var email: String
    var password: String

    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
        return jsonObject
    }
}

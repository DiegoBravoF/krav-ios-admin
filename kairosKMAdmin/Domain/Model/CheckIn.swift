//
//  CheckIn.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 12/5/24.
//

import Foundation

struct CheckIn: Codable, Hashable, Identifiable {
    var date: String?
    var id: String?

    static func == (lhs: CheckIn, rhs: CheckIn) -> Bool {
        lhs.id == rhs.id
    }
}

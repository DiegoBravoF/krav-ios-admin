//
//  Class.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 6/5/24.
//

import Foundation

struct Class: Hashable, Identifiable {
    var id: String

    var group: String {
        switch id {
            case "L/X 10.30":       return "MONDAY_10"
            case "L/X 18.30":       return "MONDAY_18"
            case "L/X 20.00":       return "MONDAY_20"
            case "M/J 18.30":       return "TUESDAY_18"
            case "M/J 20.00":       return "TUESDAY_20"
            default:                return "FREE"
        }
    }
}

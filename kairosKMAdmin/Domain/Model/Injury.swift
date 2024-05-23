//
//  Injury.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 11/5/24.
//

import Foundation
import SwiftUI

enum InjuryType: String, CaseIterable {
    case mild
    case severe
    case slightPain
    case other

    var icon: String {
        switch self {
        case .mild:             return "stethoscope"
        case .severe:           return "stethoscope"
        case .slightPain:       return "stethoscope"
        case .other:            return "pin"
        }
    }

    var title: String {
        switch self {
        case .mild:             return "Leve"
        case .severe:           return "Grave"
        case .slightPain:       return "Molestia"
        case .other:            return "Otro"
        }
    }

    var color: Color {
        switch self {
        case .mild:             return Color.orange.opacity(0.4)
        case .severe:           return Color.red.opacity(0.4)
        case .slightPain:       return Color.yellow.opacity(0.4)
        case .other:            return Color.gray.opacity(0.4)
        }
    }
}

struct Injury: Identifiable {
    var id: String
    var student: Student
    var comment: String
    var type: InjuryType
//    var status: String
//    var date: String
}

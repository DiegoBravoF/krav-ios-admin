//
//  Issue.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 26/12/23.
//

import Foundation
import SwiftUI

enum IssueType: String, CaseIterable {
    case uniform = "UNIFORM"
    case hard = "HARD"
    case hurting = "HURTING"
    case discipline = "DISCIPLINE"
    case other = "OTHER"

    var icon: String {
        switch self {
        case .uniform:          return "hanger"
        case .hard:             return "figure.martial.arts"
        case .hurting:          return "figure.fall"
        case .discipline:       return "light.beacon.max"
        case .other:            return "pin"
        }
    }

    var title : String {
        switch self {
        case .uniform:          return "Uniforme"
        case .hard:             return "Fuerte"
        case .hurting:          return "Hace daño"
        case .discipline:       return "Disciplina"
        case .other:            return "Otro"
        }
    }

    var color: Color {
        switch self {
        case .uniform:          return Color.green.opacity(0.4)
        case .hard, .hurting:
                                return Color.brown.opacity(0.4)
        case .discipline:       return Color.blue.opacity(0.4)
        case .other:            return Color.gray.opacity(0.4)
        }
    }
}

struct Issue: Identifiable {
    var id: String
    var student: Student
    var comment: String
    var type: IssueType
//    var status: String
//    var date: String
}

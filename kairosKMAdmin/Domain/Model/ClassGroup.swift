//
//  ClassGroup.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 12/5/24.
//

import Foundation

enum ClassGroup: String {
    case MONDAY_10
    case MONDAY_18
    case MONDAY_20
    case TUESDAY_18
    case TUESDAY_20
    case FREE

    var title: String {
        switch self {
            case .MONDAY_10:        return "L/X 10:30"
            case .MONDAY_18:        return "L/X 18:30"
            case .MONDAY_20:        return "L/X 20:00"
            case .TUESDAY_18:       return "M/J 18:30"
            case .TUESDAY_20:       return "M/J 20:00"
            case .FREE:             return "Horario libre"
        }
    }

    func getGroup(_ title: String) -> Self {
        switch title {
            case "L/X 10:30":       return .MONDAY_10
            case "L/X 18:30":       return .MONDAY_18
            case "L/X 20:00":       return .MONDAY_20
            case "M/J 18:30":       return .TUESDAY_18
            case "M/J 20:00":       return .TUESDAY_20
            default:                return .FREE
        }
    }
}

//
//  BeltType.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 12/5/24.
//

import Foundation
import SwiftUI

enum BeltType: String {
    case WHITE
    case YELLOW
    case ORANGE
    case GREEN
    case BLUE
    case BROWN
    case BLACK
    case BLACK_1
    case BLACK_2
    case BLACK_3
    case BLACK_4
    case BLACK_5

    var beltColor: Color {
        switch self {
        case .WHITE:
            return .white
        case .YELLOW:
            return .yellow
        case .ORANGE:
            return .orange
        case .GREEN:
            return .green
        case .BLUE:
            return .blue
        case .BROWN:
            return .brown
        case .BLACK:
            return .black
        case .BLACK_1:
            return .black
        case .BLACK_2:
            return .black
        case .BLACK_3:
            return .black
        case .BLACK_4:
            return .black
        case .BLACK_5:
            return .black
        }
    }
}

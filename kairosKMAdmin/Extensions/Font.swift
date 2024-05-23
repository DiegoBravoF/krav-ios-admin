//
//  Font.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 29/9/23.
//

import Foundation
import SwiftUI

extension Font {
    static func montserratRegular(size: CGFloat) -> Font {
        guard UIFont.familyNames.contains("Montserrat-Regular") else {
            return Font.system(size: size)
        }
        return .custom("Montserrat-Regular", size: size)
    }

    static func montserratBold(size: CGFloat) -> Font {
        guard UIFont.familyNames.contains("Montserrat-Bold") else {
            return Font.system(size: size)
        }
        return .custom("Montserrat-Bold", size: size)
    }

    static func dinRegular(size: CGFloat) -> Font {
        guard UIFont.familyNames.contains("DINNextLTPro-Regular") else {
            return Font.system(size: size)
        }
        return .custom("DINNextLTPro-Regular", size: size)
    }

    static func dinBold(size: CGFloat) -> Font {
        guard UIFont.familyNames.contains("DIN Next LT Pro") else {
            return Font.system(size: size)
        }
        return .custom("DIN Next LT Pro", size: size)
    }

    static func primetime(size: CGFloat) -> Font {
        guard UIFont.familyNames.contains("PRIMETIME") else  {
            return Font.system(size: size)
        }
        return .custom("PRIMETIME", size: size)
    }
}

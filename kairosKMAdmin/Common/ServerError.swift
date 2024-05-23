//
//  ServerError.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 25/1/24.
//

import Foundation

enum ServerError: Error {
    case unknown

    var code: Int {
        return 400
    }

    var description: String {
        "Ha ocurrido un error de servidor"
    }

    static func error(code: Int) -> ServerError {
        return .unknown
    }
}

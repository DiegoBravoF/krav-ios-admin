//
//  NetworkError.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 24/1/24.
//

import Foundation

enum NetworkError: Error {
    case general(Error)
    case status(Int)
    case json(Error)
    case noHTTP

    var description:String {
        switch self {
        case .general(let error):
            return "General Error \(error.localizedDescription)"
        case .status(let int):
            return "Status Error: \(int)"
        case .json(let error):
            return "JSON Error: \(error)"
        case .noHTTP:
            return "No HTTP request"
        }
    }
}

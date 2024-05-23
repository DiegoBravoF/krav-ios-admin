//
//  ViewModelAlertProtocol.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 25/1/24.
//

import Foundation

protocol ViewModelAlertProtocol: AnyObject {
    func clientError(_ error: String)
    func manageError(_ error: Error)
    func manageParsedError(_ error: String)
}

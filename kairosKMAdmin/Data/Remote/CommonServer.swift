//
//  CommonServer.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 17/11/23.
//

import Foundation

class CommonServer: BaseServerProtocol {
    static let shared = CommonServer()

    let manager: ServerManager = ServerManager.defaultManager()

    func login(_ request: LoginRequest, completion: @escaping (Result<(LoginResponse), Error>) -> Void) {
        manager.login(request) { response in
            self.handle(response: response, completion: completion)
        }
    }

    func getStudents(completion: @escaping (Result<([StudentResponse]), Error>) -> Void) {
        manager.getStudents { response in
            self.handle(response: response, completion: completion)
        }
    }

    func getCheckins(_ request: CheckinsRequest, completion: @escaping (Result<([StudentResponse]), Error>) -> Void) {
        manager.getCheckins(request) { response in
            self.handle(response: response, completion: completion)
        }
    }

    func getIssues(completion: @escaping (Result<(EmptyResponse), Error>) -> Void) {
        manager.getIssues { response in
            self.handle(response: response, completion: completion)
        }
    }

    func submitIssue(_ request: IssueRequest, completion: @escaping (Result<(EmptyResponse), Error>) -> Void) {
        manager.submitIssue(request) { response in
            self.handle(response: response, completion: completion)
        }
    }

    func getInjuries(completion: @escaping (Result<(EmptyResponse), Error>) -> Void) {
        manager.getInjuries { response in
            self.handle(response: response, completion: completion)
        }
    }

    func submitInjury(_ request: InjuryRequest, completion: @escaping (Result<(EmptyResponse), Error>) -> Void) {
        manager.submitInjury(request) { response in
            self.handle(response: response, completion: completion)
        }
    }
}

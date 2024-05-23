//
//  IssuesUseCase.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 13/5/24.
//

import Foundation

protocol IssuesUseCaseProtocol {
    func getIssues(completion: @escaping ([Issue]) -> Void)
    func submitIssue(issue: IssueRequest, completion: @escaping () -> Void)
}

class IssuesUseCase: UseCaseHandler, IssuesUseCaseProtocol {
    static let shared = IssuesUseCase()
    let server = CommonServer()

    func getIssues(completion: @escaping ([Issue]) -> Void) {
        server.getIssues { result in
            do {
                try self.handle {
                    let response = try result.get()
                    completion([])
//                    completion(response.map { $0.toStudentModel() })
                }
            } catch {
                self.callbackDelegate?.manageError(error)
            }
        }
    }

    func submitIssue(issue: IssueRequest, completion: @escaping () -> Void) {
        server.submitIssue(issue) { result in
            do {
                try self.handle {
                    let response = try result.get()
                    completion()
                }
            } catch {
                self.callbackDelegate?.manageError(error)
            }
        }
    }
}

//
//  CheckinsUseCase.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 11/5/24.
//

import Foundation

protocol CheckinsUseCaseProtocol {
    func getCheckins(group: String, day: String, completion: @escaping ([Student]) -> Void)
}

class CheckinsUseCase: UseCaseHandler, CheckinsUseCaseProtocol {
    static let shared = CheckinsUseCase()
    let server = CommonServer()

    func getCheckins(group: String, day: String, completion: @escaping ([Student]) -> Void) {
        server.getCheckins(CheckinsRequest(group: group, day: day)) { result in
            do {
                try self.handle {
                    let response = try result.get()
                    completion(response.map { $0.toStudentModel() })
                }
            } catch {
                self.callbackDelegate?.manageError(error)
            }
        }
    }
}

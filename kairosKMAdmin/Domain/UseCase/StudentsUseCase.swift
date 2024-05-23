//
//  StudentsUseCase.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 30/4/24.
//

import Foundation

protocol StudentsUseCaseProtocol {
    func getStudents(completion: @escaping ([Student]) -> Void)
}

class StudentsUseCase: UseCaseHandler, StudentsUseCaseProtocol {
    static let shared = StudentsUseCase()
    let server = CommonServer()

    func getStudents(completion: @escaping ([Student]) -> Void) {
        server.getStudents { result in
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

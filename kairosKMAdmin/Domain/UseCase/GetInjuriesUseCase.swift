//
//  GetInjuriesUseCase.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import Foundation

protocol GetInjuriesUseCaseProtocol {
    func getInjuries(completion: @escaping ([Injury]) -> Void)
}

class GetInjuriesUseCase: UseCaseHandler, GetInjuriesUseCaseProtocol {
    static let shared = GetInjuriesUseCase()
    let server = CommonServer()

    func getInjuries(completion: @escaping ([Injury]) -> Void) {
        server.getInjuries { result in
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
}

//
//  SubmitInjuryUseCase.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import Foundation

protocol SubmitInjuryUseCaseProtocol {
    func submitInjury(injury: InjuryRequest, completion: @escaping () -> Void)
}

class SubmitInjuryUseCase: UseCaseHandler, SubmitInjuryUseCaseProtocol {
    static let shared = SubmitInjuryUseCase()
    let server = CommonServer()

    func submitInjury(injury: InjuryRequest, completion: @escaping () -> Void) {
        server.submitInjury(injury) { result in
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

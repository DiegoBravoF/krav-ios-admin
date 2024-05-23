//
//  LoginUseCase.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 6/10/23.
//

import Foundation

protocol LoginUseCaseProtocol {
    func login(_ email: String, _ password: String, completion: @escaping () -> Void)
}

class LoginUseCase: UseCaseHandler, LoginUseCaseProtocol {
    static let shared = LoginUseCase()
    let server = CommonServer()
    
    func login(_ email: String, _ password: String, completion: @escaping () -> Void) {
        server.login(LoginRequest(email: email, password: password)) { result in
            do {
                try self.handle {
                    let response = try result.get()
                    UserDefaults.standard.setValue(password, forKey: kPassword)
                    UserDefaults.standard.setValue(email, forKey: kUsername)
                    User.shared.firstName = response.firstName
                    User.shared.saveToken(response.token)
                    User.shared.notLoggedIn = false
                }
            } catch {
                self.callbackDelegate?.manageError(error)
            }
        }
    }
}

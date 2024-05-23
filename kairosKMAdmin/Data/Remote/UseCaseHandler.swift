//
//  UseCaseHandler.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 17/11/23.
//

import Foundation

class UseCaseHandler {
    typealias VoidHandler = () -> Void
    typealias Handler<T> = (T) -> Void

    weak var callbackDelegate: ViewModelAlertProtocol?

    convenience init(delegate: ViewModelAlertProtocol?) {
        self.init()
        self.callbackDelegate = delegate
    }

    // MARK: - Async Await
    func handleAlert(error: Error) async {
        self.callbackDelegate?.manageError(error)
    }

    func handle<T>(result: Result<T, Error>, completion: @escaping Handler<T>) {
        do {
            try self.handle {
                let value = try result.get()
                DispatchQueue.main.async {
                    completion(value)
                }
            }
        } catch {
            self.callbackDelegate?.manageError(error)
//            let result = "default.error.message".localized
//            self.callbackDelegate?.defaultError(result)
        }
    }

    func handleEmpty<T>(result: Result<T, Error>, completion: @escaping VoidHandler) {
        do {
            try self.handle {
                _ = try result.get()
                DispatchQueue.main.async {
                    completion()
                }
            }
        } catch {
//            let result = "default.error.message".localized
//            self.callbackDelegate?.defaultError(result)
        }
    }

    func handle(f: () throws -> Void) throws {
        do {
            try f()
        } catch ServerManagerError.noInternetError(let error) {
            print("noInternetError", error)
//            self.callbackDelegate?.noInternetError(error)
        } catch ServerManagerError.defaultError(let error) {
            print("defaultError", error)
//            self.callbackDelegate?.defaultError(error)
        } catch ServerManagerError.unauthorizedError(let error) {
            print("unauthorizedError", error)
//            self.callbackDelegate?.unauthorized(error)
        } catch ServerManagerError.otp(let error) {
            print("otpRequiredSetPassword", error)
//            self.callbackDelegate?.otpRequireSetPassword(error)
        } catch ServerManagerError.loginOtp(let error) {
            print("loginOtpError", error)
//            self.callbackDelegate?.loginOtp(error)
        } catch ServerManagerError.loginEmailOtp(let error) {
            print("loginEmailError", error)
//            self.callbackDelegate?.loginEmail(error)
        } catch ServerManagerError.clientError(let error, let status) {
            print("clientError", error)
            self.callbackDelegate?.manageParsedError(error)
        } catch ServerManagerError.serverError(let error) {
            print("serverError", error)
//            self.callbackDelegate?.serverError(error)
        } catch ServerManagerError.internalServerError(let error) {
//            self.callbackDelegate?.internalServerError(error)
        } catch ServerManagerError.maintenanceServerError(let error) {
//            self.callbackDelegate?.maintenanceServerError(error)
        } catch let error {
            throw error
        }
    }

    func handleNoErrorShown<T>(result: Result<T, Error>, completion: @escaping VoidHandler) {
        do {
            try self.handle {
                _ = try result.get()
                DispatchQueue.main.async {
                    completion()
                }
            }
        } catch {
//            _ = "default.error.message".localized
//            self.callbackDelegate?.noErrorShown()
        }
    }

    deinit {
        print("deinit \(self)")
    }
}

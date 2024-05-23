//
//  ServerMangerErrorHandler.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 17/11/23.
//

import Alamofire
import Foundation

struct BaseResponse: Codable {
    var message: String
    var code: String
}


struct ResponseError: Codable {
    var message: String
    var code: Int?
}

struct ServerManagerErrorHandler {
    private let unauthorizedError = 401
    private let emailVerifyError = 408
    private let requestParamsError = 404
    private let clientError = 400
    private let internalServerError = 503
    private let maintenanceError = 500
    private let otpError = 422
    private let loginEmailError = 427
    private let loginOtpError = 428
    private let purchase050Error = 408

    private let keyMessage = "message"

    var isConnectedToInternet: Bool {
        NetworkReachabilityManager()?.isReachable ?? false
    }

    func validate(error: Error?, responseData: Data?, _ url: String? = nil) -> ServerManagerError? {
        if !isConnectedToInternet {
            return makeNoInternetError(nil)
        } else if let err = error as? URLError {
            return handle(err)
        } else if let err = error as? AFError {
            if err.isServerTrustEvaluationError {
                return ServerManagerError.sslPinning("Server trust evaluation pinning error")
            } else {
                return handle(err, responseData, url)
            }
        } else if let err = clientBaseResponse(responseData) {
            return err
        } else {
            return nil
        }
    }

    // MARK: - App

    /*
     *    Return:
     *        noInternetError
     *        URLError
     */
    private func handle(_ error: URLError) -> ServerManagerError {
        switch error.code {
        case .notConnectedToInternet:
            print(error.code, ": notConnectedToInternet")
            return makeNoInternetError(error)
        case .networkConnectionLost:
            print(error.code, ": networkConnectionLost")
            return makeNoInternetError(error)
        default:
            print(error.code, ": defaultError ", error)
            return makeDefaultError(error)
        }
    }

    /*
     *    Return:
     *        noInternetError
     */
    private func makeNoInternetError(_ error: URLError?) -> ServerManagerError {
        let result = "Ha ocurrido un error"
        return ServerManagerError.noInternetError(result)
    }

    /*
     *    Return:
     *        defaultError
     */
    private func makeDefaultError(_ error: URLError?) -> ServerManagerError {
        let result = "Ha ocurrido un error"
        return ServerManagerError.defaultError(result)
    }

    // MARK: - Server

    /*
     *    Return:
     *        clientError
     *        expiredSession
     *        unknownError
     */
    private func handle(_ error: AFError?, _ responseData: Data?, _ url: String?) -> ServerManagerError {
        guard error != nil else {
            return makeServerError(nil)
        }

        switch error! {
        case .responseSerializationFailed:
            return makeClientError(responseData)
        default:
            break
        }

        let errorCode: Int = error?.responseCode ?? 500
        switch errorCode {
        case unauthorizedError:
            print(url ?? "", errorCode, ": Unauthorized Error")
            return makeUnauthorized(nil)
        case otpError:
            return makeOtp(nil)
        case loginOtpError:
            return makeLoginOtp(nil)
        case loginEmailError:
            return makeEmailLoginOtp(nil)
        case requestParamsError:
            print(url ?? "", errorCode, ": Request Params error")
            return makeClientError(responseData)
        case clientError, emailVerifyError, purchase050Error:
            print(url ?? "", errorCode, ": Client error")
            return makeClientError(responseData)
        case maintenanceError:
            print(url ?? "", errorCode, ": Maintenance Server error")
            return makeMaintenanceError(responseData)
        case internalServerError:
            print(url ?? "", errorCode, ": Internal Server error")
            return makeInternalError(responseData)
        default:
            print(url ?? "", errorCode, ": Client error")
            return makeClientError(responseData)
        }
    }

    /*
     *    Return:
     *        clientError
     */
    private func makeClientError(_ responseData: Data?) -> ServerManagerError {
        let responseError: ResponseError? = parseResponseError(responseData)
        var result = "Ha ocurrido un error"
        if let message = responseError?.message, !message.isEmpty {
            result = message
        }

        if let code = responseError?.code, Int(code) == 401 {
            return ServerManagerError.unauthorizedError(result)
        } else {
            return ServerManagerError.clientError(result, statusCode: Int(responseError?.code ?? 0))
        }
    }

    private func parseResponseError(_ responseData: Data?) -> ResponseError? {
        var responseError: ResponseError?

        if let data = responseData {
            let jsonDecoder = JSONDecoder()
            do {
                if let jsonString = String(data: data, encoding: String.Encoding.utf8) {
                    print(jsonString)
                }

                responseError = try jsonDecoder.decode(ResponseError.self, from: data)
            } catch let error {
                print(error)
            }
        }
        return responseError
    }

    // swiftlint:disable cyclomatic_complexity
    private func clientBaseResponse(_ responseData: Data?) -> ServerManagerError? {
        if let response = responseData, response.isEmpty {
            return nil
        }
        var baseResponse: BaseResponse!

        if let data = responseData {
            let jsonDecoder = JSONDecoder()
            do {
                if let jsonString = String(data: data, encoding: String.Encoding.utf8) {
                    print(jsonString)
                }
                baseResponse = try jsonDecoder.decode(BaseResponse.self, from: data)
            } catch let error {
                print("JSON PARSING ERROR: \(error)")
                return ServerManagerError.getServerError()
            }
        }

        switch Int(baseResponse.code) {
        case 200, 204:
            return nil
        case 400: // generic error
            return ServerManagerError.clientError(baseResponse.message)
        case 401: // invalid token error
            return ServerManagerError.clientError(baseResponse.message)
        case 408:
            return ServerManagerError.clientError(baseResponse.message, statusCode: 408)
        case 409:
            return ServerManagerError.clientError(baseResponse.message, statusCode: 409)
        case 404:
            return ServerManagerError.clientError(baseResponse.message)
        case 422:
            return ServerManagerError.otp(baseResponse.message)
        case 427:
            return ServerManagerError.loginEmailOtp(baseResponse.message)
        case 428:
            return ServerManagerError.loginOtp(baseResponse.message)
        case 500:
            return ServerManagerError.internalServerError(baseResponse.message)
        case 503:
            return ServerManagerError.maintenanceServerError(baseResponse.message)
        default:
            return ServerManagerError.clientError(baseResponse.message)
        }
    }
    // swiftlint:enable cyclomatic_complexity

    /*
     *    Return:
     *        serverError
     */
    private func makeServerError(_ responseData: Data?) -> ServerManagerError {
        let responseError: ResponseError? = parseResponseError(responseData)
        var result = "Ha ocurrido un error"
        if let message = responseError?.message, !message.isEmpty {
            result = message
        }
        return ServerManagerError.serverError(result)
    }

    /*
     *    Return:
     *        maintenanceError
     */
    private func makeMaintenanceError(_ responseData: Data?) -> ServerManagerError {
        let responseError: ResponseError? = parseResponseError(responseData)
        var result = "Ha ocurrido un error"
        if let message = responseError?.message, !message.isEmpty {
            result = message
        }
        return ServerManagerError.maintenanceServerError(result)
    }

    /*
     *    Return:
     *        internalError
     */
    private func makeInternalError(_ responseData: Data?) -> ServerManagerError {
        let responseError: ResponseError? = parseResponseError(responseData)
        var result = "Ha ocurrido un error"
        if let message = responseError?.message, !message.isEmpty {
            result = message
        }
        return ServerManagerError.internalServerError(result)
    }

    /*
     *    Return:
     *        expiredSession
     */
    private func makeUnauthorized(_ error: String?) -> ServerManagerError {
        let result = "Tu sesión ha caducado"
        UserDefaults.standard.removeObject(forKey: kToken)
        return ServerManagerError.unauthorizedError(result)
    }

    /*
     *    Return:
     *        otp password. Require set password
     */
    private func makeOtp(_ error: String?) -> ServerManagerError {
        let result = "Ha ocurrido un error"
        return ServerManagerError.otp(error ?? result)
    }

    /*
     *    Return:
     *       Otp password. Require set password
     */
    private func makeLoginOtp(_ error: String?) -> ServerManagerError {
        let result = "Ha ocurrido un error"
        return ServerManagerError.loginOtp(error ?? result)
    }

    /*
     *    Return:
     *       Login Email. Require email
     */
    private func makeEmailLoginOtp(_ error: String?) -> ServerManagerError {
        let result = "Ha ocurrido un error"
        return ServerManagerError.loginEmailOtp(error ?? result)
    }
}

enum ServerManagerError: Error {
    // Server
    case unauthorizedError(String)
    case clientError(String, statusCode: Int? = nil)
    case serverError(String)

    // App
    case noInternetError(String)
    case defaultError(String)
    case noErrorShown(String)

    // Login con otp, es necesario cambiar password
    case otp(String)
    case loginOtp(String)
    case loginEmailOtp(String)

    // UserCards errors
    case internalServerError(String)
    case maintenanceServerError(String)

    case sslPinning(String)

    static func getServerError() -> ServerManagerError {
        serverError("Ha ocurrido un error")
    }
    static func getUnauthorizedError() -> ServerManagerError {
        unauthorizedError("Ha ocurrido un error")
    }
}

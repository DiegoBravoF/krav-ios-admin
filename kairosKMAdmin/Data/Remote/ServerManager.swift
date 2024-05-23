//
//  ServerManager.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 13/10/23.
//

import Alamofire
import AlamofireNetworkActivityIndicator
import Foundation

protocol ServerManagerProtocol: AnyObject {
    var baseURL: String! { get set }

    func publicRequest(_ url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?) -> DataRequest
}

class ServerManager: ServerManagerProtocol {
    static var uuid: String = UUID().uuidString
    private var defaultHeaders: HTTPHeaders
    var baseURL: String!
    var version: String = ""
    var manager: Session
    var timeoutIntervalForRequest: TimeInterval = 45.0
    var timeoutIntervalForResource: TimeInterval = 45
    var retryLimit = 1
    var isTokenRefreshing = false
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = timeoutIntervalForResource
        configuration.httpShouldSetCookies = true
        configuration.protocolClasses = nil
        
        self.manager = Session(configuration: configuration)
        NetworkActivityIndicatorManager.shared.isEnabled = true
        self.defaultHeaders = [:]
    }
    
    init(baseURL: String,
         version: String,
         timeoutIntervalForRequest: TimeInterval,
         timeoutIntervalForResource: TimeInterval,
         headers: HTTPHeaders,
         protocolClasses: [AnyClass]?) {
        self.baseURL = baseURL
        self.timeoutIntervalForRequest = timeoutIntervalForRequest
        self.timeoutIntervalForResource = timeoutIntervalForResource
        self.version = version
        self.defaultHeaders = headers
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = timeoutIntervalForResource
        configuration.httpShouldSetCookies = true
        configuration.protocolClasses = protocolClasses
        configuration.urlCredentialStorage = .shared
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        NetworkActivityIndicatorManager.shared.isEnabled = true
        manager = Session(configuration: configuration)
    }
    
    static func defaultManager() -> ServerManager {
        let serverManager = ServerManager(baseURL: baseUrl,
                                          version: "",
                                          timeoutIntervalForRequest: 45.0,
                                          timeoutIntervalForResource: 45.0,
                                          headers: [:],
                                          protocolClasses: nil)
        
        return serverManager
    }
    
    // MARK: - Requests
    
    func publicRequest(_ url: String,
                       method: HTTPMethod,
                       parameters: Parameters? = nil,
                       encoding: ParameterEncoding = JSONEncoding.default,
                       headers: HTTPHeaders? = nil) -> DataRequest {
        let requestHeaders = prepareHeaders(for: url, method: method, parameters: parameters, headers: headers)
        return manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: requestHeaders)
    }

    fileprivate func prepareHeaders(for url: URLConvertible,
                                    method: HTTPMethod,
                                    parameters: Parameters? = nil,
                                    headers: HTTPHeaders? = nil) -> HTTPHeaders? {
        print("[REQUEST][URL] \(url)")
        print("[REQUEST][METHOD] \(method)")
        if let params = parameters {
            print("[REQUEST][PARAMETERS] \(params as AnyObject)")
        }
        var requestHeaders: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
//            "deviceModel": modelName(),
//            "iosVersion": UIDevice.current.systemVersion,
//            "appVersion": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown",
//            "deviceType": deviceType(),
//            "user-session-id": Self.uuid,
        ]
        if var token = UserDefaults.standard.object(forKey: kToken) as? String {
            if !token.contains("Bearer") {
                token = String(format: "Bearer %@", token)
            }
            requestHeaders["Authorization"] = token
        }
        print("[REQUEST][HEADERS] \(requestHeaders as AnyObject)")
        return  requestHeaders
    }

    fileprivate func prepareUploadHeaders(for url: URLConvertible,
                                          method: HTTPMethod,
                                          parameters: Parameters? = nil,
                                          headers: HTTPHeaders? = nil) -> HTTPHeaders? {
        guard var requestHeaders: HTTPHeaders = prepareHeaders(for: url,
                                                               method: method,
                                                               parameters: parameters,
                                                               headers: headers) else { return nil }
        requestHeaders["Content-Type"] = "multipart/form-data"
        return requestHeaders
        
    }

    func uploadRequest(_ url: String,
                       method: HTTPMethod = .get,
                       parameters: Parameters? = nil,
                       fileParameter: String,
                       encoding: ParameterEncoding = URLEncoding.default,
                       headers: HTTPHeaders? = nil,
                       fileRequest: UploadFileRequest) -> UploadRequest {
        let file = fileRequest.fileName + "." + fileRequest.fileExtension
        let requestHeaders = prepareHeaders(for: url, method: method, parameters: parameters, headers: headers)
        if let imageData = fileRequest.image?.jpegData(compressionQuality: 0.1) {
            return manager.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: fileParameter, fileName: file, mimeType: fileRequest.mimeType)
//                if let category = fileRequest.category {
//                    multipartFormData.append(category.data(using: String.Encoding.utf8) ?? Data.init(), withName: "category")
//                }
                print("[REQUEST][MULTIPARTFORMDATA] \(multipartFormData)")
            },
            to: url,
            usingThreshold: UInt64(),
            method: method,
            headers: requestHeaders)
        } else if fileRequest.fileUrl != nil {
            return manager.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(fileRequest.fileUrl!, withName: fileParameter, fileName: file, mimeType: fileRequest.mimeType)
//                if let category = fileRequest.category {
//                    multipartFormData.append(category.data(using: String.Encoding.utf8) ?? Data.init(), withName: "category")
//                }
                print("[REQUEST][MULTIPARTFORMDATA] \(multipartFormData)")
            },
            to: url,
            usingThreshold: UInt64(),
            method: method,
            headers: requestHeaders)
        } else {
            return manager.upload(multipartFormData: { multipartFormData in
//                multipartFormData.append(fileRequest.comment.data(using: String.Encoding.utf8) ?? Data.init(), withName: "description")
                print("[REQUEST][MULTIPARTFORMDATA] \(multipartFormData)")
            },
            to: url,
            usingThreshold: UInt64(),
            method: method,
            headers: requestHeaders)
        }
    }

//    func modelName() -> String {
//        var systemInfo = utsname()
//        uname(&systemInfo)
//        let machineMirror = Mirror(reflecting: systemInfo.machine)
//        let identifier = machineMirror.children.reduce("") { identifier, element in
//            guard let value = element.value as? Int8, value != 0 else { return identifier }
//            return identifier + String(UnicodeScalar(UInt8(value)))
//        }
//        return identifier
//    }
//
//    func deviceType() -> String {
//        let model = UIDevice.current.model
//        if model.contains("iPad") {
//            return "tablet"
//        } else if model.contains("iPhone") {
//            return "mobile"
//        } else {
//            return ""
//        }
//    }
}

//
//  BaseServer.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 17/11/23.
//

import Alamofire
import Foundation

protocol BaseServerProtocol {
    var manager: ServerManager { get }

    func handle<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void)
    func handleNoError<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void)
}

extension BaseServerProtocol {
    func handle<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void) {
        switch response.result {
        case .success(let result):
            do {
                print(result)
                let json = result
                if  JSONSerialization.isValidJSONObject(json) {
                        let data = try JSONSerialization.data(withJSONObject: json, options: [])
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(T.self, from: data)
                        completion(Result.success(result))
                    } else {
                        let baseSuccess: [String: Any] = ["message": "success", "code": 204]
                        let data = try JSONSerialization.data(withJSONObject: baseSuccess, options: [])
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(T.self, from: data)
                        completion(Result.success(result))
                    }
            } catch let error {
                print(error)
                if let parsedError = ServerManagerErrorHandler().validate(error: error, responseData: response.data, response.response?.url?.absoluteString ?? "") {
                    completion(Result.failure(parsedError))
                } else {
                    completion(Result.failure(error))
                }
            }
        case .failure(let error):
            print(error)
            if let parsedError = ServerManagerErrorHandler().validate(error: error, responseData: response.data, response.response?.url?.absoluteString ?? "") {
                completion(Result.failure(parsedError))
            } else {
                completion(Result.failure(error))
            }
        }
    }

    func handleNoError<T: Decodable>(response: AFDataResponse<Any>, completion: @escaping (Result<T, Error>) -> Void) {
        switch response.result {
        case .success(let result):
            do {
                print(result)
                let json = result
                if  JSONSerialization.isValidJSONObject(json) {
                        let data = try JSONSerialization.data(withJSONObject: json, options: [])
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(T.self, from: data)
                        completion(Result.success(result))
                    } else {
                        let baseSuccess: [String: Any] = ["message": "success", "code": 204]
                        let data = try JSONSerialization.data(withJSONObject: baseSuccess, options: [])
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(T.self, from: data)
                        completion(Result.success(result))
                    }
            } catch let error {
                print(error)
                completion(Result.failure(ServerManagerError.noErrorShown("")))
            }
        case .failure(let error):
            print(error)
            completion(Result.failure(ServerManagerError.noErrorShown("")))
        }
    }
}

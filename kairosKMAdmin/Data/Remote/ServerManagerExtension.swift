//
//  ServerManagerExtension.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 17/11/23.
//

import Alamofire
import Foundation

extension ServerManager {
    func login(_ request: LoginRequest, completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/login"

        publicRequest(completeRequest,
                      method: .get,
                      parameters: request.parameters,
                      encoding: URLEncoding.queryString)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }

    func getStudents(completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/users"

        publicRequest(completeRequest,
                      method: .get)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }

    func getCheckins(_ request: CheckinsRequest,  completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/usersWithCheckIns"

        publicRequest(completeRequest,
                      method: .get,
                      parameters: request.parameters,
                      encoding: URLEncoding.queryString)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }

    func getIssues(completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/issues"

        publicRequest(completeRequest,
                      method: .get)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }

    func submitIssue(_ request: IssueRequest, completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/issue"

        publicRequest(completeRequest,
                      method: .post,
                      parameters: request.parameters,
                      encoding: JSONEncoding.default)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }

    func getInjuries(completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/injuries"

        publicRequest(completeRequest,
                      method: .get)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }

    func submitInjury(_ request: InjuryRequest, completion: @escaping (AFDataResponse<Any>) -> Void) {
        let completeRequest = baseURL + "/injury"

        publicRequest(completeRequest,
                      method: .post,
                      parameters: request.parameters,
                      encoding: JSONEncoding.default)
        .validate()
        .responseJSON { response in
            completion(response)
        }
    }
}

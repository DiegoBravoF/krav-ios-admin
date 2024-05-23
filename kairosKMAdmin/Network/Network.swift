//
//  Network.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 24/1/24.
//

import Foundation
import OSLog

//let baseUrl = URL(string: "http://2.139.63.251:8080")!

final class Network {
    static let shared = Network()

    let defaultLog = Logger()

    func getJSON<JSON:Codable>(request: URLRequest,
                               type: JSON.Type,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> JSON {


        #if DEBUG
                let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "network")
                logger.info("Request URL: \(String(describing: request.url?.absoluteString ?? "no url"))")
                logger.info("Request HEADER: \(String(describing: request.allHTTPHeaderFields))")
                logger.info("Request METHOD: \(String(describing: request.httpMethod))")
                if let httpBody = request.httpBody {
                    logger.info("Request PARAMS: \(String(decoding: httpBody, as: UTF8.self))")
                } else {
                    logger.info("Request WITHOUT PARAMS")
                }
        #endif

        let (data, response) = try await URLSession.shared.dataRequest(for: request)
        guard let response = response as? HTTPURLResponse else { throw NetworkError.noHTTP }
        if response.statusCode == 200 {
            do {
                return try decoder.decode(JSON.self, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
}

extension URLSession {
     func dataRequest(from url:URL) async throws -> (Data, URLResponse) {
        do {
            return try await data(from: url)
        } catch {
            throw NetworkError.general(error)
        }
    }
      func dataRequest(for request:URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await data(for: request)
        } catch {
            throw NetworkError.general(error)
        }
    }
}

enum HTTPMethods: String {
    case get = "GET"
}


extension URLRequest {
    static func get(url:URL, token:String? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        request.timeoutInterval = 30
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        return request
    }
}

extension URL {
//    static func restorePass() -> URL {
//        return baseUrl.appending(path: "/resetPassword")
//    }
}


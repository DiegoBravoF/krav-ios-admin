//
//  UserNetworkDataSource.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 6/10/23.
//

import Foundation

protocol UserNetworkDataSourceProtocol {
}

struct UserNetworDataSource: UserNetworkDataSourceProtocol {
    let session: URLSession
    let baseURL: String = "http://2.139.63.251:8080"
    let bgQueue = DispatchQueue(label: "bg_kairos_km")

    init(_ session: URLSession) {
        self.session = session
    }
}

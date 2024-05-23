//
//  EventResponse.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 28/11/23.
//

import Foundation

struct EventResponse: Codable {
    var dateInit: Int
    var dateFinish: Int
    var id: String
    var name: String
    var price: String?
    var address: String?
    var description: String?
    var policy: String?
    var images: [String] = []
    var url: String?
}

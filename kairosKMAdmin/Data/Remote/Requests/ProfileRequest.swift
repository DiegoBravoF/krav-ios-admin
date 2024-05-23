//
//  ProfileRequest.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 16/1/24.
//

import Foundation

struct ProfileRequest: Codable {
    var name: String?
    var firstSurname: String?
    var secondSurname: String?
    var email: String?
    var sosPhone: String?
    var phone: String?
    var birthday: Int?
    var postalCode: String?
    var classSchedule: String?
    var kronosDay: String?
    var knownKairos: String?
    var kmInterest: [String?]?
    var videoTerm: Bool?
    var privacyTerm: Bool?
    var regulationTerm: Bool?
    var consentTerm: Bool?

    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
        return jsonObject
    }
}

//
//  ProfileResponse.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 30/11/23.
//

import Foundation

struct ProfileResponse: Codable {
    var email: String?
    var enrollDate: Int?
    var fee: String?
    var firstName: String?
    var firstSurname: String?
    var secondSurname: String?
    var phone: String?
    var birthday: Int?
    var trainingStatus: String?
    var picture: String?
    var ftu: Bool
}

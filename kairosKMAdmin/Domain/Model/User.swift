//
//  User.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 7/11/23.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    static var shared = User()

    var firstName: String = ""
    var email: String?
    var enrollDate: Date?
    var fee: String?
    var firstSurname: String?
    var secondSurname: String?
    var phone: String?
    var trainingStatus: String?
    var birthday: Date?
    var picture: String?
    var ftu: Bool?
    var schedule: String?
    var kronosDay: String?

    var username: String? {
        if let username = UserDefaults.standard.value(forKey: kUsername) as? String, !username.isEmpty {
            return username
        } else if let token: String = UserDefaults.standard.value(forKey: kToken) as? String, !token.isEmpty {
            let jwt = JWTDecoder.init().decode(jwtToken: token)
            return jwt["username"] as? String
        }
        return nil
    }

    var password: String {
        guard let pass: String = UserDefaults.standard.value(forKey: kPassword) as? String else { return ""}
        return pass
    }

    var fullName: String {
        firstName + " " + (firstSurname ?? "") + " " + (secondSurname ?? "")
    }

    var profileEnrolDate: String {
        enrollDate?.getEnrolDate() ?? ""
    }

    var pictureUrl: URL? {
        guard let pictureTxt = picture else { return nil }
        return URL(string: pictureTxt)
    }

    @AppStorage(kToken) var sessionToken: String?
    @Published var notLoggedIn: Bool = true

    func saveToken(_ token: String) {
        User.shared.sessionToken = token
    }

    func removeToken() {
        User.shared.sessionToken = nil
    }

    func clearUser() {
        User.shared.firstName = ""
        User.shared.email = nil
        User.shared.enrollDate = nil
        User.shared.fee = nil
        User.shared.firstSurname = nil
        User.shared.secondSurname = nil
        User.shared.phone = nil
        User.shared.trainingStatus = nil
        User.shared.birthday = nil
        User.shared.picture = nil
        removeToken()
    }

    func toProfileRequest() -> ProfileRequest {
        ProfileRequest(name: firstName,
                       firstSurname: firstSurname,
                       secondSurname: secondSurname,
                       email: email,
                       birthday: Int(birthday?.timeIntervalSince1970 ?? 0))
    }
}

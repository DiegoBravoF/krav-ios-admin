//
//  StudentResponse.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 6/5/24.
//

import Foundation

struct StudentResponse: Codable {
    var id: Int
    var firstName: String
    var firstSurname: String
    var secondSurname: String
    var role: String
    var beltType: String
    var email: String
    var phone: String
    var group: String

    func toStudentModel() -> Student {
        return Student(id: "\(id)",
                       name: firstName,
                       surname: firstSurname + " " + secondSurname,
                       email: email,
                       phone: phone, 
                       role: role,
                       group: group,
                       beltType: beltType)
    }
}

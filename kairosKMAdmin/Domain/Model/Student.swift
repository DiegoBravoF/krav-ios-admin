//
//  Student.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 26/12/23.
//

import Foundation
import SwiftUI

struct Student: Identifiable, Hashable {
    static let preview = Student(id: "1",
                                 name: "Veronica",
                                 surname: "Cordobés",
                                 email: "verocordobes@hotmail.com",
                                 phone: "123456789", 
                                 group: "TUESDAY_18")
    static let preview1 = Student(id: "2",
                                  name: "Diego",
                                  surname: "Bravo",
                                  email: "diegobravo@hotmail.com")
    var id: String
    var name: String
    var surname: String
    var email: String
    var phone: String?
    var role: String?
    var group: String?
    var beltType: String?
    var picture: String?
    var checkIns: [CheckIn] = []

    var fullname: String {
        name + " " + surname
    }

    var pictureUrl: URL? {
        guard let pictureTxt = picture else { return nil }
        return URL(string: pictureTxt)
    }

    var classTime: String {
        ClassGroup(rawValue: group ?? "")?.title ?? ""
    }

    var beltColor: Color {
        BeltType(rawValue: beltType ?? "")?.beltColor ?? .white
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.id == rhs.id
    }
}

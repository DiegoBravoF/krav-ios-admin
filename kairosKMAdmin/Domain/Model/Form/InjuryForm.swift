//
//  InjuryForm.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import Foundation

class InjuryForm: ObservableObject {
    var fields: [FormField]
    let student: Student
    var typeField: FormField
    var descriptionField: FormField

    var validates: Bool {
        !typeField.data.isEmpty
    }

    init(_ student: Student) {
        self.student = student
        typeField = FormField(type: .injuryType, data: "")
        descriptionField = FormField(type: .issueDescription, data: "")
        fields = [typeField, descriptionField]
    }

    func toInjuryRequest() -> InjuryRequest {
        InjuryRequest(type: typeField.data,
                      userId: student.id,
                      description: descriptionField.data)
    }
}

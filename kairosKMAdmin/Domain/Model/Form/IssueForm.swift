//
//  IssueForm.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 12/5/24.
//

import Foundation

class IssueForm: ObservableObject {
    var fields: [FormField]
    let student: Student
    var typeField: FormField
    var descriptionField: FormField

    var validates: Bool {
        !typeField.data.isEmpty
    }

    init(_ student: Student) {
        self.student = student
        typeField = FormField(type: .issueType, data: "")
        descriptionField = FormField(type: .issueDescription, data: "")
        fields = [typeField, descriptionField]
    }

    func toIssueRequest() -> IssueRequest {
        IssueRequest(type: typeField.data,
                     userId: student.id,
                     description: descriptionField.data)
    }
}

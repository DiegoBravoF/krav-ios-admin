//
//  NewIssueViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 12/5/24.
//

import Foundation

class NewIssueViewModel: ObservableObject {
    @Published var form: IssueForm {
        didSet {
            continueDisabled = !form.validates
        }
    }
    @Published var continueDisabled: Bool = true

    init(_ student: Student) {
        form = IssueForm(student)
    }

    func submitIssue() {
        IssuesUseCase.shared.submitIssue(issue: form.toIssueRequest()) {}
    }
}

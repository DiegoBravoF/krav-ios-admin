//
//  NewInjuryViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import Foundation

class NewInjuryViewModel: ObservableObject {
    @Published var form: InjuryForm {
        didSet {
            continueDisabled = !form.validates
        }
    }
    @Published var continueDisabled: Bool = true

    init(_ student: Student) {
        form = InjuryForm(student)
    }

    func submitInjury() {
        SubmitInjuryUseCase.shared.submitInjury(injury: form.toInjuryRequest()) {}
    }
}

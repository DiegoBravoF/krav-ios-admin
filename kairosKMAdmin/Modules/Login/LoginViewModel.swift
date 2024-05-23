//
//  LoginViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 30/4/24.
//

import Foundation

class LoginViewModel: ObservableViewModel {
    @Published var form = LoginForm()
    //    @Published var user: User? = nil
    //    @Published var continueButtonDisabled = false
        @Published var isLoading = false

    func login() {
        LoginUseCase.shared.callbackDelegate = self
//        isLoading = true
//        continueButtonDisabled = true
//        LoginUseCase.shared.login(form.fields[0].data, form.fields[1].data) { user in
        LoginUseCase.shared.login("verocordobes@hotmail.com", "ACF1920.") {
//            self.user = user
            self.isLoading = false
        }
    }
}

//
//  ObservableViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 23/4/24.
//

import Foundation

class ObservableViewModel: ObservableObject, ViewModelAlertProtocol {
    @Published var showAlert = false
    var alertTitle = ""
    var alertText = ""
    var alertTextResetPass = "Hemos enviado un enlace a tu email. Por favor, revisa tu bandeja de entrada o tu carpeta de spam"

    func clientError(_ error: String) {
        alertText = error
        showAlert = true
    }

    func manageError(_ error: Error) {
        Task {
            await MainActor.run(body: {
                haptic(type: .error)
                alertText = error.localizedDescription
                showAlert = true
            })
        }
    }

    func manageParsedError(_ error: String) {
        Task {
            await MainActor.run(body: {
                haptic(type: .error)
                alertText = error
                showAlert = true
            })
        }
    }}

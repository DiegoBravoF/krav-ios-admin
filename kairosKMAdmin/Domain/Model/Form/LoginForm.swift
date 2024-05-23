//
//  LoginForm.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 24/1/24.
//

import Foundation

class LoginForm: ObservableObject {
    var fields: [FormField]
    
    var validates: Bool {
        fields.allSatisfy({ !$0.data.isEmpty })
    }

    init() {
        fields = [FormField(type: .loginEmail, data: User.shared.username ?? ""),
                  FormField(type: .password, data: User.shared.password)]
    }
}

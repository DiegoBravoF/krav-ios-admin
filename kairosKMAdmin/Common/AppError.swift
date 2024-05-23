//
//  AppError.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 25/1/24.
//

import Foundation

typealias OkAlertAction = (title: String, isDestructive: Bool, action: () -> Void)
typealias CancelAlertAction = (title: String, action: () -> Void)

struct AppError: Identifiable {
    let id = UUID().uuidString
    var title: String = ""
    var description: String = ""

    // Buttons Actions
    let primaryAction: CancelAlertAction
    let secondaryAction: OkAlertAction?

    init(title: String? = nil,
         description: String,
         primaryAction: CancelAlertAction,
         secondaryAction: OkAlertAction? = nil) {
        self.title = title ?? "Error_key"
        self.description = description
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
}

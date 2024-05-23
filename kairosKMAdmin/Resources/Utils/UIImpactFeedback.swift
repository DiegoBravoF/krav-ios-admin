//
//  UIImpactFeedback.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 25/1/24.
//

import UIKit

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

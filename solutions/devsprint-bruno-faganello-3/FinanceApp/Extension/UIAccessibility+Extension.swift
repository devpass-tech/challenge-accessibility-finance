//
//  UIAccessibility+Extension.swift
//  FinanceApp
//
//  Created by Bruno Silva on 21/06/22.
//

import UIKit

extension UIAccessibility {
    
    enum AnnouncementText: String {
        case button = "Botão Clicado"
    }
    
    static func announce(_ value: AnnouncementText) {
        UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument: value)
    }
}

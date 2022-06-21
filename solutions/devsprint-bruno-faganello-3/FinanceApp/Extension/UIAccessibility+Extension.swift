//
//  UIAccessibility+Extension.swift
//  FinanceApp
//
//  Created by Bruno Silva on 21/06/22.
//

import UIKit

extension UIAccessibility {
    
    static func announce(_ text: String) {
        UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument: text)
    }
}

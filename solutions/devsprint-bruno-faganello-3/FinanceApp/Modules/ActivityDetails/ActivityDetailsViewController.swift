//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let titleMessage: String = "Report an issue"
    private let message: String = "The issue was reported"
    private let titleMessageButton: String = "Thanks!"

    private lazy var activityDetailsView: ActivityDetailsView = {

        let activityDetailsView = ActivityDetailsView()
        activityDetailsView.delegate = self
        return activityDetailsView
    }()
    
    // MARK: - LifeCycle

    override func loadView() { self.view = activityDetailsView }
}

// MARK: - Extension

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {

    func didPressReportButton() {
        
        UIAccessibility.announce(.button.rawValue)
        
        let alertViewController = UIAlertController(title: titleMessage,
                                                    message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: titleMessageButton,
                                   style: .default)
        
        alertViewController.accessibilityElements = [titleMessage,
                                                     message,
                                                     titleMessageButton]
        
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}

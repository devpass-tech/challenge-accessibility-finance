//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController {
    
    private let titleAlert = "Contact selection"
    private let messageAlert = "A contact was selected"

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
}

extension TransfersViewController: TransferViewDelegate {

    func didPressChooseContactButton() {

        let contactListViewController = ContactListViewController()
        contactListViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: contactListViewController)
        self.present(navigationController, animated: true)
    }

    func didPressTransferButton(with amount: String) {

        let confirmationViewController = ConfirmationViewController(amount: amount)
        let navigationController = UINavigationController(rootViewController: confirmationViewController)
        self.present(navigationController, animated: true)
    }
}

extension TransfersViewController: ContactListViewControllerDelegate {

    func didSelectContact() {

        self.dismiss(animated: true)

        let alertViewController = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        alertViewController.view.accessibilityIdentifier = "custom_alert"
        alertViewController.view.accessibilityValue = "\(titleAlert)-\(messageAlert)"
        
        
        let action = UIAlertAction(title: "Thanks", style: .default)
        action.accessibilityHint = "Return to the transfer screen"
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}

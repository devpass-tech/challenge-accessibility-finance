//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()
    
    // MARK: - LifeCycle

    override func loadView() {
        self.view = transferView
    }
}

// MARK: - Extension 0203Naires

extension TransfersViewController: TransferViewDelegate {
    func didEditTextField(text: String) {
        
        var valueConverted: String {
            return "\(text) reais"
        }
        
        UIAccessibility.post(notification: .announcement, argument: valueConverted)
    }
    
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

        let alertViewController = UIAlertController(title: "Contact selection",
                                                    message: "A contact was selected",
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks",
                                   style: .default)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}

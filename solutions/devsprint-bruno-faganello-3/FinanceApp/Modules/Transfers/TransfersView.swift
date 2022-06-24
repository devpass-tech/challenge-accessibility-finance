//
//  TransfersView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol TransferViewDelegate: AnyObject {

    func didPressChooseContactButton()
    func didPressTransferButton(with amount: String)
}

final class TransfersView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: TransferViewDelegate?

    // MARK: - Private Properties
    
    private let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        return stackView
    }()

    private let amountTextField: UITextField = {

        let textField = UITextField()
        textField.placeholder = "$0"
        
        textField.accessibilityTraits = .searchField
        textField.accessibilityValue = textField.text
        
        textField.font = UIFont.boldSystemFont(ofSize: 34)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
    }()

    private  lazy var chooseContactButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Choose contact", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.accessibilityValue = "Botão escolher contato"
        button.accessibilityTraits = .button
        button.addTarget(self, action: #selector(chooseContact), for: .touchUpInside)
        return button
    }()

    private lazy var transferButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Transfer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.accessibilityValue = "Botão transferência"
        button.accessibilityTraits = .button
        button.addTarget(self, action: #selector(transfer), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupBackgroundColor()
        setupViews()
        setupConstraints()
    }
    
    private func setupBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setupViews() {
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(chooseContactButton)
        addSubview(stackView)
        addSubview(transferButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            transferButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            transferButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            transferButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            transferButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    // MARK: - Actions

    @objc
    func chooseContact() {
        delegate?.didPressChooseContactButton()
    }

    @objc
    func transfer() {
        delegate?.didPressTransferButton(with: amountTextField.text ?? "0")
    }
}

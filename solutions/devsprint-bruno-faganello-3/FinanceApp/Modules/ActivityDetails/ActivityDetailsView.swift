//
//  ActivityDetailsView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol ActivityDetailsViewDelegate: AnyObject {

    func didPressReportButton()
}

class ActivityDetailsView: UIView {

    weak var delegate: ActivityDetailsViewDelegate?

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.isAccessibilityElement = false
        return stackView
    }()

    let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.image = UIImage(named: "bag.circle.fill")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    let activityNameLabel: UILabel = {

        let label = UILabel()
        label.text = "Mall"
        label.accessibilityLabel = "Mall"
        label.isAccessibilityElement = true
        label.textAlignment = .center

        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    let categoryLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.text = "Shopping"
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Shopping"
        label.accessibilityTraits = .staticText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5

        return label
    }()

    let priceContainerView: UIView = {

        let view = UIView()
        return view
    }()

    let priceLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.text = "$100"
        label.accessibilityLabel = "100 reais"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    let timeLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true
        label.text = "8:57 AM"
        label.accessibilityLabel = "8:57 da manhã"
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText

        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var reportIssueButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = true
        button.setTitle("Report a issue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(reportButtonPressed), for: .touchUpInside)
        button.isAccessibilityElement = true
        button.accessibilityTraits = .button
        return button
    }()


    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        priceContainerView.addSubview(priceLabel)
        priceContainerView.addSubview(timeLabel)

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(activityNameLabel)
        stackView.addArrangedSubview(categoryLabel)
        stackView.addArrangedSubview(priceContainerView)

        addSubview(stackView)
        addSubview(reportIssueButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: reportIssueButton.topAnchor),

            categoryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 70),
            categoryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            categoryLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 30),

            priceLabel.centerXAnchor.constraint(equalTo: priceContainerView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceContainerView.centerYAnchor),
            timeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            timeLabel.centerXAnchor.constraint(equalTo: priceLabel.centerXAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),

            reportIssueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            reportIssueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            reportIssueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            reportIssueButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func reportButtonPressed() {
        delegate?.didPressReportButton()
    }
}

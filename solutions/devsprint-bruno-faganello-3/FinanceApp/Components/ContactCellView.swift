import UIKit

final class ContactCellView: UITableViewCell {

   private var mainStackView: UIStackView = {
       let stack = UIStackView(frame: .zero)
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.spacing = 16
       stack.alignment = .center
       return stack
    }()

    private var labelsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "avatar-placeholder")
        return imageView
    }()

    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Contact Name"
        return label
    }()

    lazy var contactPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "(11) 99999-9999"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactCellView {
    func addSubviews() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(avatarImageView)
        mainStackView.addArrangedSubview(labelsStackView)
        labelsStackView.addArrangedSubview(contactNameLabel)
        labelsStackView.addArrangedSubview(contactPhoneLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureStyle() {
        accessoryType = .disclosureIndicator
    }
}


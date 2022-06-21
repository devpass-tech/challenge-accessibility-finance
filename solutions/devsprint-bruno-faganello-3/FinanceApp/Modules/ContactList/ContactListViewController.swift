import UIKit

protocol ContactListViewControllerDelegate: AnyObject {
    func didSelectContact()
}

final class ContactListViewController: UIViewController {
    weak var delegate: ContactListViewControllerDelegate?

    lazy var contactListView: ContactListView = {
        let contactListView = ContactListView()
        contactListView.delegate = self
        return contactListView
    }()

    override func loadView() {
        view = contactListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact List"
    }
}

extension ContactListViewController: ContactListViewDelegate {
    func didSelectContact() {
        delegate?.didSelectContact()
    }
}

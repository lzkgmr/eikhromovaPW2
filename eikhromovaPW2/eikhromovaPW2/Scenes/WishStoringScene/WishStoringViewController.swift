import UIKit

final class WishStoringViewController: UIViewController {
    
    // MARK: Enum(Constants)
    private enum Constants {
        static let tableCornerRadius: CGFloat = 20
        static let tableOffsetV: CGFloat = 110
        static let tableOffsetH: CGFloat = 40
        static let numberOfSections: Int = 2
        static let savedWishesKey: String = "savedWishes"
        static let editWindowTitle: String = "Edit the wish"
        static let editWindowMessage: String = "Change the wish's description"
        static let saveTitle: String = "Save"
        static let cancelTitle: String = "Cancel"
        static let editTitle: String = "Edit"
        static let deleteTotle: String = "Delete"
    }
    
    // MARK: Fields
    internal var backgroundColor: UIColor?
    private let table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = []
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
        loadWishes()
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .darkGray
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        table.pinVertical(to: view, Constants.tableOffsetV)
        table.pinHorizontal(to: view, Constants.tableOffsetH)
        
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
    
    private func loadWishes() {
        if let savedWishes = defaults.array(forKey: Constants.savedWishesKey) as? [String] {
            wishArray = savedWishes
        }
    }
    
    private func saveWishes() {
        defaults.set(wishArray, forKey: Constants.savedWishesKey)
    }
    
    private func showEditWindow(for index: Int) {
        let alert = UIAlertController(
            title: Constants.editWindowTitle,
            message: Constants.editWindowMessage,
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
            textField.text = self.wishArray[index]
        }
        
        let saveAction = UIAlertAction(
            title: Constants.saveTitle,
            style: .default
        ) { [weak self] _ in
            guard let self = self,
            let newText = alert.textFields?.first?.text, !newText.isEmpty else { return }
            self.wishArray[index] = newText
            self.saveWishes()
            self.table.reloadRows(at: [IndexPath(row: index, section: 1)], with: .automatic)
        }
        alert.addAction(saveAction)
        
        let cancelAction = UIAlertAction(title: Constants.cancelTitle, style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return wishArray.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: AddWishCell.reuseId, for: indexPath) as! AddWishCell
                cell.addWish = { [weak self] wish in
                    self?.wishArray.append(wish)
                    self?.saveWishes()
                    self?.table.reloadData()
                }
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath) as! WrittenWishCell
                cell.textLabel?.text = wishArray[indexPath.row]
                return cell
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.section == 1 {
            wishArray.remove(at: indexPath.row)
            saveWishes()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - UITableViewDelegate
extension WishStoringViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == 1 else { return nil }

        let editAction = UIContextualAction(style: .normal, title: Constants.editTitle) { [weak self] _, _, completionHandler in
            self?.showEditWindow(for: indexPath.row)
            completionHandler(true)
        }
        editAction.backgroundColor = .orange
        
        let deleteAction = UIContextualAction(style: .destructive, title: Constants.deleteTotle) { [weak self] _, _, completionHandler in
            self?.wishArray.remove(at: indexPath.row)
            self?.saveWishes()
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}

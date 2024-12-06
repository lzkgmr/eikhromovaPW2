import UIKit

final class WishStoringViewController: UIViewController {
    
    // MARK: - Properties
    internal var backgroundColor: UIColor?
    private let table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = []
    private let defaults = UserDefaults.standard
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
        let backButton = UIBarButtonItem(image: UIImage(systemName: Constants.backButton), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        navigationItem.leftBarButtonItem = backButton
        loadWishes()
        configureTable()
    }
    
    // MARK: - Private Methods
    
    // MARK: Table Configuration
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .clear
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        table.pinVertical(to: view, Constants.tableOffsetV)
        table.pinHorizontal(to: view, Constants.tableOffsetH)
        
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
    
    // MARK: Data Persistence Methods
    private func loadWishes() {
        if let savedWishes = defaults.array(forKey: Constants.savedWishesKey) as? [String] {
            wishArray = savedWishes
        }
    }
    
    private func saveWishes() {
        defaults.set(wishArray, forKey: Constants.savedWishesKey)
    }
    
    // MARK: Navigation Methods
    @objc
    private func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Edit Wish Window
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

extension WishStoringViewController: UITableViewDataSource {
    
    // MARK: Table Data Source Methods
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
    
    // MARK: Row Deletion Method
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.section == 1 {
            wishArray.remove(at: indexPath.row)
            saveWishes()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension WishStoringViewController: UITableViewDelegate {
    
    // MARK: Swipe Action Configuration
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

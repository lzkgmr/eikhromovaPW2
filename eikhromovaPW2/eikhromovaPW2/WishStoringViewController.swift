//
//  WishStoringViewController.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    // MARK: Enum(Constants)
    private enum Constants {
        static let tableCornerRadius: CGFloat = 20
        static let tableOffsetV: CGFloat = 110
        static let tableOffsetH: CGFloat = 40
        static let numberOfSections: Int = 2
    }
    
    // MARK: Fields
    var backgroundColor: UIColor?
    private let table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .darkGray
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        table.pinVertical(to: view, Constants.tableOffsetV)
        table.pinHorizontal(to: view, Constants.tableOffsetH)
        
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)

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
                    self?.table.reloadData()}
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath) as! WrittenWishCell
                cell.textLabel?.text = wishArray[indexPath.row]
                return cell
            default:
                return UITableViewCell()
        }
    }
}

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
    }
    
    // MARK: Fields
    var backgroundColor: UIColor?
    private let table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
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
        
        table.register(WrittenWishCell.self,forCellReuseIdentifier: WrittenWishCell.reuseId)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WrittenWishCell.reuseId, for: indexPath)
        
        guard let wishCell = cell as? WrittenWishCell else { return cell }
        
        wishCell.configure(with: wishArray[indexPath.row])
        
        return wishCell
    }
    
}

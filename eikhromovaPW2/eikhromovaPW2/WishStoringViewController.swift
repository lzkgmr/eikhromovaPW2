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
        static let tableOffsetVertical: CGFloat = 110
        static let tableOffsetHorizontal: CGFloat = 40
    }
    
    // MARK: Fields
    var backgroundColor: UIColor?
    private let table: UITableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .red
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        
        table.pinVertical(to: view, Constants.tableOffsetVertical)
        table.pinHorizontal(to: view, Constants.tableOffsetHorizontal)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

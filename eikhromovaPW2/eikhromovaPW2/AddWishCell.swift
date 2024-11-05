import UIKit

final class AddWishCell: UITableViewCell {
    static let reuseId = "AddWishCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.textLabel?.text = "Add a new wish"
        self.textLabel?.textAlignment = .center
    }
}

import UIKit

// MARK: - WrittenWishCell
final class WrittenWishCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 8
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wrapLabelOffset: CGFloat = 15
        static let fontSize: CGFloat = 5
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Properties
    static let reuseId: String = "WrittenWishCell"
    private let wrap: UIView = UIView()
    private let wishLabel: UILabel = UILabel()
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    // MARK: - Public Methods
    func configure(with wish: String) {
        wishLabel.text = wish
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(wrap)
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.pinVertical(to: self, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: self, Constants.wrapOffsetH)
        
        wrap.addSubview(wishLabel)
        wishLabel.pin(to: wrap, Constants.wrapLabelOffset)
    }
}

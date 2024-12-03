import UIKit

final class WrittenWishCell: UITableViewCell {
    
    // MARK: Enum(Constants)
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 8
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wrapLabelOffset: CGFloat = 15
        static let fontSize: CGFloat = 5
    }
        
    // MARK: Fields
    static let reuseId: String = "WrittenWishCell"
    private let wrap: UIView = UIView()
    private let wishLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with wish: String) {
        wishLabel.text = wish
    }
    
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
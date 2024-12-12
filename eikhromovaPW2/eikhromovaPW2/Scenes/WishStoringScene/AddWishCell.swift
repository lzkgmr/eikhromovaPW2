import UIKit

// MARK: - AddWishCell
final class AddWishCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let labelText: String = "Add a new wish"
        static let wishPrompt: String = "Write your wish here to add..."
        static let addButtonTitle: String = "Add wish"
        static let fatalErrorText: String = "init(coder:) has not been implemented"
        static let addButtonRadius: CGFloat = 15
        static let textViewRadius: CGFloat = 10
        static let wishTextHeight: CGFloat = 60
        static let wishTextTop: CGFloat = 10
        static let wishTextLeading: CGFloat = 10
        static let wishTextTrailing: CGFloat = 10
        static let addWishHeight: CGFloat = 35
        static let addWishWidth: CGFloat = 110
        static let addWishTop: CGFloat = 10
        static let addWishBottom: CGFloat = 10
    }
    
    // MARK: - Properties
    static let reuseId = "AddWishCell"
    var addWish: ((String) -> Void)?
    
    // MARK: - UI Elements
    private let wishText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = Constants.textViewRadius
        textView.text = Constants.wishPrompt
        textView.textColor = .darkGray
        return textView
    }()
    private let addWishButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle(Constants.addButtonTitle, for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemPink
        addButton.layer.cornerRadius = Constants.addButtonRadius
        return addButton
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        configureUI()
        wishText.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        configureWishText()
        configureAddWishButton()
    }
    
    // MARK: - Wish Text Configuration
    private func configureWishText() {
        contentView.addSubview(wishText)
        wishText.backgroundColor = .white
        wishText.pinTop(to: contentView.topAnchor, Constants.wishTextTop)
        wishText.pinLeft(to: contentView.leadingAnchor, Constants.wishTextLeading)
        wishText.pinRight(to: contentView.trailingAnchor, Constants.wishTextTrailing)
        wishText.setHeight(Constants.wishTextHeight)
    }
    
    // MARK: - Add Wish Button Configuration
    private func configureAddWishButton() {
        contentView.addSubview(addWishButton)
        addWishButton.pinTop(to: wishText.bottomAnchor, Constants.addWishTop)
        addWishButton.pinCenterX(to: contentView.centerXAnchor)
        addWishButton.pinBottom(to: contentView.bottomAnchor, Constants.addWishBottom)
        addWishButton.setHeight(Constants.addWishHeight)
        addWishButton.setWidth(Constants.addWishWidth)
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Add Wish Button Action
    @objc private func addWishButtonPressed(_ sender: UIButton) {
        let wishTextView = wishText.text
        if let text = wishTextView, !text.isEmpty, text != Constants.wishPrompt {
            addWish?(text)
            wishText.textColor = .darkGray
            wishText.text = Constants.wishPrompt
            wishText.resignFirstResponder()
        }
    }
}

// MARK: - UITextViewDelegate
extension AddWishCell: UITextViewDelegate {
    
    // MARK: - TextView Editing Behavior
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .darkGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = Constants.wishPrompt
            textView.textColor = .darkGray
        }
    }
}

import UIKit

// MARK: - Custom UITextField with Padding
/// A 'UITextField' subclass that provides custom padding for text, editing and placeholder bounds.
final class PaddedTextField: UITextField {
    
    // MARK: - Properties
    var textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    // MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}

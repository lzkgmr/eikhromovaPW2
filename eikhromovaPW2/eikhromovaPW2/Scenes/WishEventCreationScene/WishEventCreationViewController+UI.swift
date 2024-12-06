
import UIKit

// MARK: - UI Configuration Extension
extension WishEventCreationViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let stackViewSpacing: CGFloat = 16
        static let stackViewTop: CGFloat = 200
        static let stackViewHorizontal: CGFloat = 20
        static let titleLabelPlaceholder: String = "Enter event's name"
        static let titleLabelCornerRadius: CGFloat = 15
        static let titleLabelBorderWidth: CGFloat = 1
        static let titleLabelHeight: CGFloat = 48
        static let titlePaddingViewWidth: CGFloat = 10
        static let descriptionLabelPlaceholder: String = "Enter event's description"
        static let descriptionLabelCornerRadius: CGFloat = 15
        static let descriptionLabelBorderWidth: CGFloat = 1
        static let descriptionLabelHeight: CGFloat = 48
        static let descriptionPaddingViewWidth: CGFloat = 10

        static let saveButtonHeight: CGFloat = 48
        static let saveButtonWidth: CGFloat = 200
        static let saveButtonBottom: CGFloat = 10
        static let saveButtonCornerRadius: CGFloat = 15
        static let saveButtonTitle: String = "Save event"
    }
    
    // MARK: - Stack View Configuration
    internal func configureStack() {
        configureTitleField()
        configureDescriptionField()
        configureStartDatePicker()
        configureEndDatePicker()
        
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.spacing = Constants.stackViewSpacing
        
        for element in [titleField, descriptionField, startDatePicker, endDatePicker] {
            stackView.addArrangedSubview(element)
        }
        
        stackView.pinTop(to: view.topAnchor, Constants.stackViewTop)
        stackView.pinHorizontal(to: view, Constants.stackViewHorizontal)
    }
        
    // MARK: - Title Field Configuration
    internal func configureTitleField() {
        view.addSubview(titleField)
        titleField.placeholder = Constants.titleLabelPlaceholder
        titleField.autocapitalizationType = .none
        titleField.layer.cornerRadius = Constants.titleLabelCornerRadius
        titleField.layer.borderWidth = Constants.titleLabelBorderWidth
        titleField.layer.borderColor = UIColor.systemGray3.cgColor
        titleField.textColor = .black
        titleField.setHeight(Constants.titleLabelHeight)
    }
    
    // MARK: - Description Field Configuration
    internal func configureDescriptionField() {
        view.addSubview(descriptionField)
        descriptionField.placeholder = Constants.descriptionLabelPlaceholder
        titleField.autocapitalizationType = .none
        descriptionField.layer.cornerRadius = Constants.descriptionLabelCornerRadius
        descriptionField.layer.borderWidth = Constants.descriptionLabelBorderWidth
        descriptionField.layer.borderColor = UIColor.systemGray3.cgColor
        descriptionField.textColor = .black
        descriptionField.setHeight(Constants.descriptionLabelHeight)
    }
    
    // MARK: - Start Date Picker Configuration
    internal func configureStartDatePicker() {
        view.addSubview(startDatePicker)
        startDatePicker.datePickerMode = .dateAndTime
    }
    
    // MARK: - End Date Picker Configuration
    internal func configureEndDatePicker() {
        view.addSubview(endDatePicker)
        endDatePicker.datePickerMode = .dateAndTime
    }
    
    // MARK: - Save Button Configuration
    internal func configureSaveButton() {
        view.addSubview(saveButton)
        saveButton.setTitle(Constants.saveButtonTitle, for: .normal)
        saveButton.setHeight(Constants.saveButtonHeight)
        saveButton.setWidth(Constants.saveButtonWidth)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = Constants.saveButtonCornerRadius
        
        saveButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.saveButtonBottom)
        saveButton.pinCenterX(to: view)
        
        saveButton.addTarget(self, action: #selector(saveButtonPressed(_:)), for: .touchUpInside)
    }
}

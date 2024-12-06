
import UIKit

// MARK: - UI Configuration Extension
extension WishEventCreationViewController {
    
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

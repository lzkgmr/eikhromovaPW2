
import UIKit

// MARK: - Protocols
protocol WishEventCreationDelegate: AnyObject {
    func didSetEvent(_ event: WishEventModel)
}

// MARK: - WishEventCreationViewController
final class WishEventCreationViewController: UIViewController {
    
    // MARK: - Properties
    private let calendarManager: CalendarEventManager = CalendarManager()
    weak var delegate: WishEventCreationDelegate?
    
    internal var titleField = PaddedTextField()
    internal let descriptionField = PaddedTextField()
    internal let startDatePicker = UIDatePicker()
    internal let endDatePicker = UIDatePicker()
    internal let saveButton = UIButton(type: .system)
    internal var stackView: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    
        configureUI()
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        configureStack()
        configureSaveButton()
    }
    
    @objc
    private func dismissKeyboard() {
        // MARK: - Dismiss Keyboard
        view.endEditing(true)
    }
    
    @objc
    internal func saveButtonPressed(_ sender: UIButton) {
        // MARK: - Save Button Action
        guard let title = titleField.text, !title.isEmpty,
              let description = descriptionField.text, !description.isEmpty else {
            return
        }
        
        let event = WishEventModel (
            title: title,
            description: description,
            startDate: startDatePicker.date,
            endDate: endDatePicker.date,
            note: nil
        )
        
        if calendarManager.create(eventModel: event) {
            delegate?.didSetEvent(event)
            dismiss(animated: true, completion: nil)
        } else { }
    }
}

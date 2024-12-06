import UIKit

final class WishMakerViewController: UIViewController {
    
    // MARK: - Properties
    internal var isSlidersHidden = false
    let interactor: BusinessLogic
    internal let stack: UIStackView = UIStackView()
    internal let hideButton: UIButton = UIButton(type: .system)
    internal let addWishButton: UIButton = UIButton(type: .system)
    internal let scheduleButton: UIButton = UIButton(type: .system)
    internal var sliders = [CustomSlider]()
    
    // MARK: - Initializer
    init(interactor: BusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = .systemBrown
        configureTitle()
        configureDescription()
        configureDescriptionList()
        configureAddHideButton()
        configureSliders()
        configureAddWishButton()
        configureScheduleButton()
    }
    
    // MARK: - Actions
    @objc
    internal func slidersVisibility() {
        isSlidersHidden.toggle()
        stack.isHidden = isSlidersHidden
    }
    
    @objc
    internal func addWishButtonPressed() {
        let storingVC = WishStoringViewController()
        storingVC.modalPresentationStyle = .fullScreen
        storingVC.backgroundColor = view.backgroundColor
        navigationController?.pushViewController(storingVC, animated: true)
    }
    
    @objc
    internal func scheduleWishButtonPressed() {
        let calendarVC = WishCalendarViewController()
        calendarVC.modalPresentationStyle = .fullScreen
        calendarVC.backgroundColor = view.backgroundColor
        navigationController?.pushViewController(calendarVC, animated: true)
    }
}

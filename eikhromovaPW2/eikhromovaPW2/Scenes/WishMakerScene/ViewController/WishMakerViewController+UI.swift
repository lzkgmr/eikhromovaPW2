import UIKit

// MARK: - UI Configuration Methods
extension WishMakerViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let numberOfLines: Int = 0
        static let titleFontSize: CGFloat = 32
        static let titleTop: CGFloat = 0
        static let titleName: String = "WishMaker"
        static let descriptionFontSize: CGFloat = 15
        static let descriptionLeading: CGFloat = 20
        static let descriptionTop: CGFloat = 10
        static let descriptionTrailing: CGFloat = 10
        static let descriptionText: String = "This app will fulfill some of your wishes!\n"
        static let listFontSize: CGFloat = 15
        static let listLeading: CGFloat = 35
        static let listTop: CGFloat = 30
        static let listTrailing: CGFloat = 10
        static let listFirstItem: String = "The first wish is to change the background color."
        static let listDot: String = "•"
        static let listSeparator: String = "\n"
        static let hideButtonTop: CGFloat = 9
        static let hideButtonTrailing: CGFloat = 20
        static let hideButtonText: String = " Hide sliders "
        static let buttonTitleFont: CGFloat = 12
        static let buttonRadius: CGFloat = 13
        static let buttonBorderWidth: CGFloat = 1
        static let buttonHeight: CGFloat = 35
        static let stackRadius: CGFloat = 20
        static let stackLeading: CGFloat = 20
        static let stackBottom: CGFloat = 110
        static let addButtonBottom: CGFloat = 60
        static let addButtonLeading: CGFloat = 20
        static let addButtonTrailing: CGFloat = 20
        static let wishButtonText: String = " My wishes "
        static let scheduleButtonBottom: CGFloat = 10
        static let scheduleButtonLeading: CGFloat = 20
        static let scheduleButtonTrailing: CGFloat = 20
        static let scheduleButtonText: String = " Schedule wish granting "
    }
    
    // MARK: - Title Configuration
    internal func configureTitle() {
        let title = UILabel()
        title.text = Constants.titleName
        title.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        title.textColor = UIColor.black
        
        view.addSubview(title)
        title.pinCenterX(to: view.centerXAnchor)
        title.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.titleTop)
    }
    
    // MARK: - Description Configuration
    internal func configureDescription() {
        let description = UILabel()
        description.numberOfLines = Constants.numberOfLines
        description.text = Constants.descriptionText
        description.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        description.textColor = UIColor.black
        
        view.addSubview(description)
        description.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.descriptionLeading)
        description.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.descriptionTrailing)
        description.pinTop(to: view.subviews[0].bottomAnchor, Constants.descriptionTop)
    }
    
    // MARK: - Description List Configuration
    internal func configureDescriptionList() {
        let list = UILabel()
        list.numberOfLines = Constants.numberOfLines
        
        let listItems = [
            Constants.listFirstItem
        ]
        
        let bulletListText = listItems.map { "\(Constants.listDot) \($0)" }.joined(separator: Constants.listSeparator)
        list.text = bulletListText
        list.font = UIFont.systemFont(ofSize: Constants.listFontSize)
        list.textColor = UIColor.black
        
        view.addSubview(list)
        list.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.listLeading)
        list.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.listTrailing)
        list.pinTop(to: view.subviews[0].bottomAnchor, Constants.listTop)
    }
    
    // MARK: - Hide Button Configuration
    internal func configureAddHideButton() {
        hideButton.setTitle(Constants.hideButtonText, for: .normal)
        hideButton.setTitleColor(.black, for: .normal)
        hideButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonTitleFont)
        hideButton.backgroundColor = .clear
        hideButton.layer.cornerRadius = Constants.buttonRadius
        hideButton.layer.borderWidth = Constants.buttonBorderWidth
        hideButton.layer.borderColor = UIColor.black.cgColor
        hideButton.addTarget(self, action: #selector(slidersVisibility), for: .touchUpInside)
        
        view.addSubview(hideButton)
        hideButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.hideButtonTop)
        hideButton.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.hideButtonTrailing)
    }
    
    // MARK: - Sliders Configuration
    internal func configureSliders() {
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        sliders = createSliders()
        setupSlidersActions(sliders)
        
        stack.pinCenterX(to: view.centerXAnchor)
        stack.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.stackLeading)
        stack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.stackBottom)
    }
    
    // MARK: - Add Wish Button Configuration
    internal func configureAddWishButton() {
        view.addSubview(addWishButton)
        addWishButton.setHeight(Constants.buttonHeight)
        
        addWishButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.addButtonBottom)
        addWishButton.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.addButtonLeading)
        addWishButton.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.addButtonTrailing)
        
        addWishButton.setTitle(Constants.wishButtonText, for: .normal)
        addWishButton.setTitleColor(.systemPink, for: .normal)
        addWishButton.backgroundColor = .white
        addWishButton.layer.cornerRadius = Constants.buttonRadius
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Schedule Button Configuration
    internal func configureScheduleButton() {
        view.addSubview(scheduleButton)
        scheduleButton.setHeight(Constants.buttonHeight)
        
        scheduleButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.scheduleButtonBottom)
        scheduleButton.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.scheduleButtonLeading)
        scheduleButton.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.scheduleButtonLeading)
        
        scheduleButton.setTitle(Constants.scheduleButtonText, for: .normal)
        scheduleButton.setTitleColor(.systemPink, for: .normal)
        scheduleButton.backgroundColor = .white
        scheduleButton.layer.cornerRadius = Constants.buttonRadius
        scheduleButton.addTarget(self, action: #selector(scheduleWishButtonPressed), for: .touchUpInside)
    }
}

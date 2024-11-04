//
//  WishMakerViewController.swift
//  eikhromovaPW2
//
//  Created by Imac on 28.10.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    
    // MARK: Enum(Constants)
    enum Constants {
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        static let numberOfLines: Int = 0
        
        static let titleFontSize: CGFloat = 32
        static let titleTop: CGFloat = 30
        static let descriptionFontSize: CGFloat = 15
        static let descriptionLeading: CGFloat = 20
        static let descriptionTop: CGFloat = 10
        static let descriptionTrailing: CGFloat = 10
        static let listFontSize: CGFloat = 15
        static let listLeading: CGFloat = 35
        static let listTop: CGFloat = 30
        static let listTrailing: CGFloat = 10
        static let stackRadius: CGFloat = 20
        static let stackLeading: CGFloat = 20
        static let stackBottom: CGFloat = 70
        static let colorAlpha: CGFloat = 1.0
        static let hideButtonTop: CGFloat = 38
        static let hideButtonTrailing: CGFloat = 20
        static let buttonTitleFont: CGFloat = 12
        static let buttonRadius: CGFloat = 13
        static let buttonBorderWidth: CGFloat = 1
        static let buttonHeight: CGFloat = 35
        static let animationTime: CGFloat = 0.5
        static let addButtonBottom: CGFloat = 10
        static let addButtonLeading: CGFloat = 20
        static let addButtonTrailing: CGFloat = 20
        
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        static let titleName: String = "WishMaker"
        static let descriptionText: String = "This app will fulfill some of your wishes!\n"
        static let listFirstItem: String = "The first wish is to change the background color."
        static let listDot: String = "•"
        static let listSeparator: String = "\n"
        static let fatalErrorText: String = "init(coder:) has not been implemented"
        static let hideButtonText: String = " Hide sliders "
        static let wishButtonText: String = " My wishes "
    }
    
    // MARK: Fields
    private var isSlidersHidden = false
    private let stack: UIStackView = UIStackView()
    private let addHideButton: UIButton = UIButton(type: .system)
    private let addWishButton: UIButton = UIButton(type: .system)
    private let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBrown
        configureTitle()
        configureDescription()
        configureDescriptionList()
        configureAddHideButton()
        configureSliders()
        configureAddWishButton()
    }
    
    private func configureTitle() {
        let title = UILabel()
        title.text = Constants.titleName
        title.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        title.textColor = UIColor.black
        
        view.addSubview(title)
        title.pinCentreX(view.centerXAnchor)
        title.pinTop(view.safeAreaLayoutGuide.topAnchor, Constants.titleTop)
    }
    
    private func configureDescription() {
        let description = UILabel()
        description.numberOfLines = Constants.numberOfLines
        description.text = Constants.descriptionText
        description.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        description.textColor = UIColor.black
        
        view.addSubview(description)
        description.pinLeft(view.safeAreaLayoutGuide.leadingAnchor, Constants.descriptionLeading)
        description.pinRight(view.safeAreaLayoutGuide.trailingAnchor, Constants.descriptionTrailing)
        description.pinTop(view.subviews[0].bottomAnchor, Constants.descriptionTop)
    }
    
    private func configureDescriptionList() {
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
        list.pinLeft(view.safeAreaLayoutGuide.leadingAnchor, Constants.listLeading)
        list.pinRight(view.safeAreaLayoutGuide.trailingAnchor, Constants.listTrailing)
        list.pinTop(view.subviews[0].bottomAnchor, Constants.listTop)
    }
    
    private func configureAddHideButton() {
        addHideButton.setTitle(Constants.hideButtonText, for: .normal)
        addHideButton.setTitleColor(.black, for: .normal)
        addHideButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonTitleFont)
        addHideButton.backgroundColor = .clear
        addHideButton.layer.cornerRadius = Constants.buttonRadius
        addHideButton.layer.borderWidth = Constants.buttonBorderWidth
        addHideButton.layer.borderColor = UIColor.black.cgColor
        addHideButton.addTarget(self, action: #selector(slidersVisibility), for: .touchUpInside)
        
        view.addSubview(addHideButton)
        addHideButton.pinTop(view.safeAreaLayoutGuide.topAnchor, Constants.hideButtonTop)
        addHideButton.pinRight(view.safeAreaLayoutGuide.trailingAnchor, Constants.hideButtonTrailing)
    }
    
    private func configureSliders() {
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
            slider.valueChanged = { [weak self] _ in
                self?.updateBackgroundColor()
            }
        }
        
        stack.pinCentreX(view.centerXAnchor)
        stack.pinLeft(view.safeAreaLayoutGuide.leadingAnchor, Constants.stackLeading)
        stack.pinBottom(view.safeAreaLayoutGuide.bottomAnchor, Constants.stackBottom)
    }
    
    private func updateBackgroundColor() {
        let redValue = CGFloat(sliderRed.slider.value)
        let greenValue = CGFloat(sliderGreen.slider.value)
        let blueValue = CGFloat(sliderBlue.slider.value)
        let newColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: Constants.colorAlpha)
        UIView.animate(withDuration: Constants.animationTime) {
            self.view.backgroundColor = newColor
        }
    }
    
    private func configureAddWishButton() {
        view.addSubview(addWishButton)
        addWishButton.setHeight(Constants.buttonHeight)
        addWishButton.pinBottom(view.safeAreaLayoutGuide.bottomAnchor, Constants.addButtonBottom)
        addWishButton.pinLeft(view.safeAreaLayoutGuide.leadingAnchor, Constants.addButtonLeading)
        addWishButton.pinRight(view.safeAreaLayoutGuide.trailingAnchor, Constants.addButtonTrailing)
        addWishButton.setTitle(Constants.wishButtonText, for: .normal)
        addWishButton.setTitleColor(.systemPink, for: .normal)
        addWishButton.backgroundColor = .white
        addWishButton.layer.cornerRadius = Constants.buttonRadius
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func slidersVisibility() {
        isSlidersHidden.toggle()
        stack.isHidden = isSlidersHidden
    }
    
    @objc
    private func addWishButtonPressed() {
        let storingVC = WishStoringViewController()
        storingVC.modalPresentationStyle = .fullScreen
        storingVC.backgroundColor = view.backgroundColor
        navigationController?.pushViewController(storingVC, animated: true)
    }
}

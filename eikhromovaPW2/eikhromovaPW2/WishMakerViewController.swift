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
        static let descriptionTop: CGFloat = 82
        static let listFontSize: CGFloat = 15
        static let listLeading: CGFloat = 35
        static let listTop: CGFloat = 102
        static let stackRadius: CGFloat = 20
        static let stackLeading: CGFloat = 20
        static let stackBottom: CGFloat = -40
        static let colorAlpha: CGFloat = 1.0
        static let buttonBottom: CGFloat = -280
        static let buttonTitleFont: CGFloat = 12
        static let buttonRadius: CGFloat = 10
        static let buttonBorderWidth: CGFloat = 1
        
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        static let titleName: String = "WishMaker"
        static let descriptionText: String = "This app will fulfill some of your wishes!\n"
        static let listFirstItem: String = "The first wish is to change the background color."
        static let listDot: String = "•"
        static let listSeparator: String = "\n"
        static let fatalErrorText: String = "init(coder:) has not been implemented"
        static let buttonTitle: String = " Hide sliders "
    }
    
    // MARK: Fields
    private var isSlidersHidden = false
    private let stack = UIStackView()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBrown
        configureTitle()
        configureDescription()
        configureDescriptionList()
        configureButton()
        configureSliders()
    }
    
    private func configureTitle() {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = Constants.titleName
        title.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        title.textColor = UIColor.black
        
        view.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.titleTop)
        ])
    }
    
    private func configureDescription() {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = Constants.numberOfLines
        description.text = Constants.descriptionText
        description.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        description.textColor = UIColor.black
        
        view.addSubview(description)
        NSLayoutConstraint.activate([
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.descriptionLeading),
            description.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.descriptionTop)
        ])

    }
    
    private func configureDescriptionList() {
        let list = UILabel()
        list.translatesAutoresizingMaskIntoConstraints = false
        list.numberOfLines = Constants.numberOfLines
        
        let listItems = [
            Constants.listFirstItem
        ]
        
        let bulletListText = listItems.map { "\(Constants.listDot) \($0)" }.joined(separator: Constants.listSeparator)
        list.text = bulletListText
        list.font = UIFont.systemFont(ofSize: Constants.listFontSize)
        list.textColor = UIColor.black

        
        view.addSubview(list)
        NSLayoutConstraint.activate([
            list.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.listLeading),
            list.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.listTop)
        ])
    }
    
    private func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonTitleFont)
        button.backgroundColor = .clear
        button.layer.cornerRadius = Constants.buttonRadius
        button.layer.borderWidth = Constants.buttonBorderWidth
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(slidersVisibility), for: .touchUpInside)
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.buttonBottom)
        ])
    }
    
    private func configureSliders() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
        ])
        
        let updateBackgroundColor = { [weak self] in
           let redValue = CGFloat(sliderRed.slider.value)
           let greenValue = CGFloat(sliderGreen.slider.value)
           let blueValue = CGFloat(sliderBlue.slider.value)
            self?.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: Constants.colorAlpha)
       }
       
       sliderRed.valueChanged = { _ in updateBackgroundColor() }
       sliderGreen.valueChanged = { _ in updateBackgroundColor() }
       sliderBlue.valueChanged = { _ in updateBackgroundColor() }
        
    }
    
    @objc
    private func slidersVisibility() {
        isSlidersHidden.toggle()
        stack.isHidden = isSlidersHidden
    }
}

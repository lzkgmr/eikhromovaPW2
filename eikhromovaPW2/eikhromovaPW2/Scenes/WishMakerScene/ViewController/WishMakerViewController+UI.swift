//
//  WishMakerViewController+UI.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

extension WishMakerViewController {
    
    // MARK: - Title Confoguration
    internal func configureTitle() {
        let title = UILabel()
        title.text = Constants.titleName
        title.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        title.textColor = UIColor.black
        
        view.addSubview(title)
        title.pinCenterX(to: view.centerXAnchor)
        title.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.titleTop)
    }
    
    // MARK: - Descroption Configuration
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
        addHideButton.setTitle(Constants.hideButtonText, for: .normal)
        addHideButton.setTitleColor(.black, for: .normal)
        addHideButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.buttonTitleFont)
        addHideButton.backgroundColor = .clear
        addHideButton.layer.cornerRadius = Constants.buttonRadius
        addHideButton.layer.borderWidth = Constants.buttonBorderWidth
        addHideButton.layer.borderColor = UIColor.black.cgColor
        addHideButton.addTarget(self, action: #selector(slidersVisibility), for: .touchUpInside)
        
        view.addSubview(addHideButton)
        addHideButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.hideButtonTop)
        addHideButton.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.hideButtonTrailing)
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
    
    //MARK: - Wish Button Configuration
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
}

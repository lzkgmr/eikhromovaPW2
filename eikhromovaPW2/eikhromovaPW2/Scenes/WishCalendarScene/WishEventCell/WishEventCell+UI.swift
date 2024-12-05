//
//  WishEventCell+UI.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

extension WishEventCell {
    
    // MARK: - Wrap Configuration
    internal func configureWrap() {
        contentView.addSubview(wrapView)
        
        wrapView.pin(to: self, Constants.wrapOffset)
        wrapView.layer.cornerRadius = Constants.wrapCornerRadius
        wrapView.backgroundColor = UIColor.white
    }
        
    // MARK: - Title Label Configuration
    internal func configureTitleLabel() {
        wrapView.addSubview(titleLabel)

        titleLabel.font = UIFont.systemFont(ofSize: Constants.eventCellTitleFont, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = Constants.eventCellNumberOfLines
        
        titleLabel.pinTop(to: wrapView.topAnchor, Constants.eventCellTitleTop)
        titleLabel.pinCenterX(to: contentView)
    }
    
    // MARK: - Description Label Configuration
    internal func configureDescriptionLabel() {
        wrapView.addSubview(descriptionLabel)
        
        descriptionLabel.textColor = UIColor.secondaryLabel
        descriptionLabel.font = UIFont.systemFont(ofSize: Constants.eventCellDescriptionFont, weight: .regular)
        descriptionLabel.numberOfLines = Constants.eventCellNumberOfLines
        
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, Constants.eventCellDescriptionTop)
        descriptionLabel.pinLeft(to: wrapView.leadingAnchor, Constants.eventCellDescriptionLeading)
    }
    
    // MARK: - EndDate Label Configuration
    internal func configureStartDateLabel() {
        wrapView.addSubview(startDateLabel)
        
        startDateLabel.font = UIFont.systemFont(ofSize: Constants.dateFont, weight: .regular)
        startDateLabel.textColor = UIColor.secondaryLabel
        
        startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, Constants.dateTop)
        startDateLabel.pinLeft(to: wrapView.leadingAnchor, Constants.dateLeading)
    }
    
    // MARK: - Description Label Configuration
    internal func configureEndDateLabel() {
        wrapView.addSubview(endDateLabel)
        endDateLabel.font = UIFont.systemFont(ofSize: Constants.dateFont, weight: .regular)
        endDateLabel.textColor = UIColor.secondaryLabel
        
        endDateLabel.pinTop(to: startDateLabel.bottomAnchor, Constants.dateTop)
        endDateLabel.pinLeft(to: wrapView.leadingAnchor, Constants.dateLeading)
        endDateLabel.pinBottom(to: wrapView.bottomAnchor, Constants.endDateBottom)
    }
}

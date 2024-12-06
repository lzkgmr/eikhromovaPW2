import UIKit

// MARK: - UI Configuration Extension
extension WishEventCell {
    
    // MARK: - Constants
    private enum Constants {
        static let wrapCornerRadius: CGFloat = 15
        static let wrapOffset: CGFloat = 8
        static let eventCellTitleFont: CGFloat = 25
        static let eventCellTitleTop: CGFloat = 16
        static let eventCellNumberOfLines: Int = 1
        static let eventCellDescriptionFont: CGFloat = 12
        static let eventCellDescriptionLeading: CGFloat = 12
        static let eventCellDescriptionTop: CGFloat = 16
        static let dateFont: CGFloat = 12
        static let dateTop: CGFloat = 16
        static let dateLeading: CGFloat = 12
        static let endDateBottom: CGFloat = 16
    }
    // MARK: - Wrap View Configuration
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
    
    // MARK: - Start Date Label Configuration
    internal func configureStartDateLabel() {
        wrapView.addSubview(startDateLabel)
        
        startDateLabel.font = UIFont.systemFont(ofSize: Constants.dateFont, weight: .regular)
        startDateLabel.textColor = UIColor.secondaryLabel
        
        startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, Constants.dateTop)
        startDateLabel.pinLeft(to: wrapView.leadingAnchor, Constants.dateLeading)
    }
    
    // MARK: - End Date Label Configuration
    internal func configureEndDateLabel() {
        wrapView.addSubview(endDateLabel)
        
        endDateLabel.font = UIFont.systemFont(ofSize: Constants.dateFont, weight: .regular)
        endDateLabel.textColor = UIColor.secondaryLabel
        
        endDateLabel.pinTop(to: startDateLabel.bottomAnchor, Constants.dateTop)
        endDateLabel.pinLeft(to: wrapView.leadingAnchor, Constants.dateLeading)
        endDateLabel.pinBottom(to: wrapView.bottomAnchor, Constants.endDateBottom)
    }
}

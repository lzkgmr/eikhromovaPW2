//
//  Constants.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

// MARK: Enum(Constants)
internal enum Constants {
    
    // Common
    static let numberOfLines: Int = 0
    static let fatalErrorText: String = "init(coder:) has not been implemented"
    static let backButton: String = "chevron.left"

    // Title
    static let titleFontSize: CGFloat = 32
    static let titleTop: CGFloat = 0
    static let titleName: String = "WishMaker"
    
    // Description
    static let descriptionFontSize: CGFloat = 15
    static let descriptionLeading: CGFloat = 20
    static let descriptionTop: CGFloat = 10
    static let descriptionTrailing: CGFloat = 10
    static let descriptionText: String = "This app will fulfill some of your wishes!\n"
    
    // Description List
    static let listFontSize: CGFloat = 15
    static let listLeading: CGFloat = 35
    static let listTop: CGFloat = 30
    static let listTrailing: CGFloat = 10
    static let listFirstItem: String = "The first wish is to change the background color."
    static let listDot: String = "•"
    static let listSeparator: String = "\n"
    
    // hideButton
    static let hideButtonTop: CGFloat = 9
    static let hideButtonTrailing: CGFloat = 20
    static let hideButtonText: String = " Hide sliders "
    
    // Buttons
    static let buttonTitleFont: CGFloat = 12
    static let buttonRadius: CGFloat = 13
    static let buttonBorderWidth: CGFloat = 1
    static let buttonHeight: CGFloat = 35
    
    // Sliders Stack
    static let stackRadius: CGFloat = 20
    static let stackLeading: CGFloat = 20
    static let stackBottom: CGFloat = 110
    
    // addButton
    static let addButtonBottom: CGFloat = 60
    static let addButtonLeading: CGFloat = 20
    static let addButtonTrailing: CGFloat = 20
    static let wishButtonText: String = " My wishes "
    
    // scheduleButton
    static let scheduleButtonBottom: CGFloat = 10
    static let scheduleButtonLeading: CGFloat = 20
    static let scheduleButtonTrailing: CGFloat = 20
    static let scheduleButtonText: String = " Schedule wish granting "
    
    // WishMakerViewController+Slider
    static let red: String = "Red"
    static let green: String = "Green"
    static let blue: String = "Blue"
    static let sliderMin: Double = 0
    static let sliderMax: Double = 1
    static let animationTime: CGFloat = 0.5
    static let colorAlpha: CGFloat = 1.0
    
    //WishStoringViewController
    static let tableCornerRadius: CGFloat = 20
    static let tableOffsetV: CGFloat = 110
    static let tableOffsetH: CGFloat = 40
    static let numberOfSections: Int = 2
    static let savedWishesKey: String = "savedWishes"
    static let editWindowTitle: String = "Edit the wish"
    static let editWindowMessage: String = "Change the wish's description"
    static let saveTitle: String = "Save"
    static let cancelTitle: String = "Cancel"
    static let editTitle: String = "Edit"
    static let deleteTotle: String = "Delete"
    
    // CustomSlider
    static let titleViewTop: CGFloat = 10
    static let titlViewLeading: CGFloat = 20
    static let sliderBottom: CGFloat = -10
    static let sliderLeading: CGFloat = 20
    
    // WishCalendar
    static let contentInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 60)
    static let collectionTop: CGFloat = 15
    static let collectionHeight: CGFloat = 200
    static let collectionBottom: CGFloat = 15
    static let minusToCollectionWidth: CGFloat = 40
    static let addEventButton: String = "calendar.badge.plus"
    
    // WishEventCell
    static let reuseIdentifier: String = "WishEventCell"
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
    
    // AddWishCell
    static let labelText: String = "Add a new wish"
    static let wishPrompt: String = "Write your wish here to add..."
    static let addButtonTitle: String = "Add wish"
    static let addButtonRadius: CGFloat = 15
    static let textViewRadius: CGFloat = 10
    static let wishTextHeight: CGFloat = 60
    static let wishTextTop: CGFloat = 10
    static let wishTextLeading: CGFloat = 10
    static let wishTextTrailing: CGFloat = 10
    static let addWishHeight: CGFloat = 35
    static let addWishWidth: CGFloat = 110
    static let addWishTop: CGFloat = 10
    static let addWishBottom: CGFloat = 10
    
    // WishEventCreation
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

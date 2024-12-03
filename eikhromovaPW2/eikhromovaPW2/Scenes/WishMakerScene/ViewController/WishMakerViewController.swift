//
//  WishMakerViewController.swift
//  eikhromovaPW2
//
//  Created by Imac on 28.10.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    
    // MARK: Fields
    internal var isSlidersHidden = false
    let interactor: BusinessLogic
    internal let stack: UIStackView = UIStackView()
    internal let addHideButton: UIButton = UIButton(type: .system)
    internal let addWishButton: UIButton = UIButton(type: .system)
    internal var sliders = [CustomSlider]()
    
    // MARK: - Initialization
    init(interactor: BusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
}

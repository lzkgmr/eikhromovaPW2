//
//  WishStoringViewController.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    // MARK: Fields
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
    }
}

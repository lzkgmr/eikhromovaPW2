//
//  WishCalendarViewController.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

final class WishCalendarViewController: UIViewController {
    
    // MARK: Fields
    internal var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
    }
}

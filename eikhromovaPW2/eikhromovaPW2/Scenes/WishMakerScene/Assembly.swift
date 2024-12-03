//
//  WishMakerAssembly.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

class Assembly {
    static func build() -> UIViewController {
        let presenter = WishMakerPresenter()
        let interactor = WishMakerInteractor(presenter: presenter)
        let view = WishMakerViewController(interactor: interactor)
        presenter.view = view
        return view
    }
}

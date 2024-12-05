//
//  WishMakerPresenter.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

final class WishMakerPresenter: PresentationLogic {
    internal weak var view: WishMakerViewController?
    
    func presenBackground(_ response: WishMakerModel.BackgroundColor.Response) {
        view?.updateBackgroundColor()
    }
    
    func routeToWishStoring() {
        view?.present(WishStoringViewController(), animated: true)
    }
}

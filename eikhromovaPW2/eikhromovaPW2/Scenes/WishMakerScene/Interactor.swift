//
//  WishMakerInteractor.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

final class WishMakerInteractor: BusinessLogic {
    
    private let presenter: PresentationLogic
    
    init(presenter: PresentationLogic) {
        self.presenter = presenter
    }
    
    func loadBackground(_ request: WishMakerModel.BackgroundColor.Request) {
        let red = request.red
        let green = request.green
        let blue = request.blue
        
        let color = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
        
        presenter.presenBackground(WishMakerModel.BackgroundColor.Response(color: color))
    }
    
    func loadWishStoring() {
        presenter.routeToWishStoring()
    }
}
//
//  WishMakerProtocols.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

protocol BusinessLogic {
    func loadBackground(_ request: WishMakerModel.BackgroundColor.Request)
    
    func loadWishStoring()
}


protocol PresentationLogic {
    func presenBackground(_ response: WishMakerModel.BackgroundColor.Response)
    
    func routeToWishStoring()
}

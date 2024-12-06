import UIKit

// MARK: - Business Logic Protocol
protocol BusinessLogic {
    func loadBackground(_ request: WishMakerModel.BackgroundColor.Request)
    
    func loadWishStoring()
}

// MARK: - Presentation Logic Protocol
protocol PresentationLogic {
    func presenBackground(_ response: WishMakerModel.BackgroundColor.Response)
    
    func routeToWishStoring()
}

import UIKit

// MARK: - WishMakerPresenter
final class WishMakerPresenter: PresentationLogic {
    
    // MARK: Properties
    internal weak var view: WishMakerViewController?
    
    // MARK: Presentation Logic
    func presenBackground(_ response: WishMakerModel.BackgroundColor.Response) {
        view?.updateBackgroundColor()
    }
    
    func routeToWishStoring() {
        view?.present(WishStoringViewController(), animated: true)
    }
}

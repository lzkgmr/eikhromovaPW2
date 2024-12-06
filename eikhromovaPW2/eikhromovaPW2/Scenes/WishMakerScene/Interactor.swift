import UIKit

// MARK: - WishMakerInteractor
final class WishMakerInteractor: BusinessLogic {
    
    // MARK: Properties
    private let presenter: PresentationLogic
    
    // MARK: Initializer
    init(presenter: PresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: Business Logic
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

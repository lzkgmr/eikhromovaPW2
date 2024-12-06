import UIKit

// MARK: - Assembly
class Assembly {
    
    // MARK: Build Method
    static func build() -> UIViewController {
        let presenter = WishMakerPresenter()
        let interactor = WishMakerInteractor(presenter: presenter)
        let view = WishMakerViewController(interactor: interactor)
        
        // MARK: Setting up dependencies
        presenter.view = view
        
        return view
    }
}

import UIKit

enum Assembler {
    static func build() -> UIViewController {
        let presenter = Presentor()
        let interactor = Interactor(presentor: presenter)
        let view = WishMakerViewController(interactor: interactor)
        presenter.view = view
        return view
    }
}

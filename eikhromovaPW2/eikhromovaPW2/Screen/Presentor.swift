import UIKit
final class Presentor: PresentationLogic {
    weak var view : WishMakerViewController?
    
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart()
    }

    func presentOther(_ response: Model.Other.Response) {
        view?.displayOther()
    }
    func routeTo() {
        view?.navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

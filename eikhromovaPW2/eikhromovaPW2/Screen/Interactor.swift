final class Interactor: BusinessLogic {
    private let presentor: PresentationLogic
    
    init(presentor: PresentationLogic) {
        self.presentor = presentor
    }
    
    func loadStart(_ request: Model.Start.Request) {
        presentor.presentStart(Model.Start.Response())
    }
    
    func loadOther(_ request: Model.Other.Request) {
        presentor.presentOther(Model.Other.Response())
    }
}

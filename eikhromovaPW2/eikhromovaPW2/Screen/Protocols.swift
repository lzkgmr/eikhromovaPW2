protocol BusinessLogic {
    func loadStart(_ request: Model.Start.Request)
    func loadOther(_ request: Model.Other.Request)
}


protocol PresentationLogic {
    func presentStart(_ response: Model.Start.Response)
    func presentOther(_ response: Model.Other.Response)
    
    func routeTo()
}

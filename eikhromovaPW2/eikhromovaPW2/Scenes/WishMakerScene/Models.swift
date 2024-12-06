import UIKit

// MARK: - WishMakerModel
enum WishMakerModel {
    
    // MARK: - BackgroundColor
    enum BackgroundColor {
        
        // MARK: Request
        struct Request {
            let red: Float
            let green: Float
            let blue: Float
        }
        
        // MARK: Response
        struct Response {
            let color: UIColor
        }
        
        // MARK: ViewModel
        struct ViewModel {}
    }
}

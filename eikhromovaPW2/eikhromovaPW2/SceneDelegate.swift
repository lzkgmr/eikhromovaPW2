import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // MARK: - Scene Lifecycle
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = Assembly.build()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible() 
    }

    // MARK: - Scene State Transitions
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called when the scene is disconnected (e.g., app goes to background or session is discarded).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene becomes active (e.g., after entering foreground).
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene becomes inactive (e.g., incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from background to foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called when the scene transitions from foreground to background. This is where data should be saved.
    }
}

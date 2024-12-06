import UIKit

// MARK: - WishCalendarViewController Extensions
extension WishCalendarViewController {
    
    // MARK: - Collection View Configuration
    internal func configureCollection() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = backgroundColor ?? .white
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = Constants.contentInset
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.invalidateLayout()
        }
        
        collectionView.register(WishEventCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
        
        collectionView.pinHorizontal(to: view)
        collectionView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.collectionBottom)
        collectionView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.collectionTop)
    }
    
    // MARK: - Navigation Bar Configuration
    internal func configureNavigationBarAppearance() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: Constants.backButton), style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        navigationItem.leftBarButtonItem = backButton
        
        let addEventButton = UIBarButtonItem(image: UIImage(systemName: Constants.addEventButton), style: .plain, target: self, action: #selector(addButtonPressed(_:)))
        navigationItem.rightBarButtonItem = addEventButton
        
        // Removing the white highlight on bar buttons during swipe gestures
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

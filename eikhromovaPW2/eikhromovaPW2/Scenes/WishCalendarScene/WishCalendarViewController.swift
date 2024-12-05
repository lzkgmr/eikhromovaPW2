//
//  WishCalendarViewController.swift
//  eikhromovaPW2
//
//  Created by Imac on 04.12.2024.
//

import UIKit

final class WishCalendarViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Fields
    internal var backgroundColor: UIColor?
    internal let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    internal var events: [WishEventModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor ?? .white
        
        configureNavigationBarAppearance()
        configureCollection()
        
        loadEvents()
    }
    
    @objc
    internal func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    internal func addButtonPressed(_ sender: UIButton) {
        let wishCreatingVC = WishEventCreationViewController()
        wishCreatingVC.delegate = self
        present(wishCreatingVC, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? WishEventCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: events[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WishCalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width - Constants.minusToCollectionWidth, height: Constants.collectionHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell tapped at index \(indexPath.item)")
    }
}

// MARK: - WishEventCreationDelegate
extension WishCalendarViewController: WishEventCreationDelegate {
    func didSetEvent(_ event: WishEventModel) {
        saveEvent(event)
    }
}

//
//  ViewController.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

private enum Constatnts {
    static let heightSearchbar: CGFloat = 44
    static let placeholder = "Я ищу..."
    static let sharesIdentifier = "SharesView"
    static let advertisingIdentifier = "AdvertisingView"
    static let shopingIdentifier = "ShopingView"
    static let helpOriginYSearchBar: CGFloat = 40
    static let section = 3
    static let itemInSection = 1
    static let helpSizeHeightShares: CGFloat = 3
    static let helpSizeHeightAdvertising: CGFloat = 2
    static let helpSizeHeightShoping: CGFloat = 5
}

class ViewController: UIViewController {
    
    private var sharesCells = [SharesView]()
    private var search = [Phone]()
    private var searching = false
    private var mainCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        view.addTapGestureToHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let searchBar = UISearchBar(
            frame: CGRect(
                x: .zero,
                y: view.safeAreaInsets.top + Constatnts.helpOriginYSearchBar,
                width: view.frame.width,
                height: Constatnts.heightSearchbar
            )
        )
        searchBar.autoresizingMask = [
            .flexibleTopMargin,
            .flexibleBottomMargin
        ]
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        
         let mainCollectionView = UICollectionView(
            frame: CGRect(
                x: .zero,
                y: searchBar.frame.origin.y + searchBar.frame.height,
                width: view.frame.width,
                height: view.frame.height - searchBar.frame.maxY
            ),
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        mainCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainCollectionView.register(
            SharesView.self,
            forCellWithReuseIdentifier: Constatnts.sharesIdentifier
        )
        mainCollectionView.register(
            AdvertisingView.self,
            forCellWithReuseIdentifier: Constatnts.advertisingIdentifier
        )
        mainCollectionView.register(
            ShopingView.self,
            forCellWithReuseIdentifier: Constatnts.shopingIdentifier
        )
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.backgroundColor = .white
        mainCollectionView.isScrollEnabled = false
        view.addSubview(mainCollectionView)
        
        self.mainCollectionView = mainCollectionView
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(kbWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        guard let size = kbFrameSize else { return }
        mainCollectionView?.contentInset.bottom = size.height
    }
    
    @objc private func kbWillHide(_ notification: Notification) {
        mainCollectionView?.contentInset.bottom = .zero
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.placeholder = Constatnts.placeholder
        searchBar.setShowsCancelButton(true, animated: true)
        
        mainCollectionView?.isScrollEnabled = true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        mainCollectionView?.isScrollEnabled = false
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        mainCollectionView?.isScrollEnabled = false
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let arrayShoping = Shoping.setup()
        search = arrayShoping
            .filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searching = true
        mainCollectionView?.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Constatnts.section
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        Constatnts.itemInSection
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constatnts.sharesIdentifier,
                for: indexPath
            ) as? SharesView ?? SharesView()
            cell.set(cells: Shares.setupShares())
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constatnts.advertisingIdentifier,
                for: indexPath
            ) as? AdvertisingView ??  AdvertisingView()
            cell.setAdvertising(cells: Shares.setupAdvertisign())
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Constatnts.shopingIdentifier,
                for: indexPath
            ) as? ShopingView ?? ShopingView()
            
            if searching {
            cell.setShoping(cells: search)
            } else {
            cell.setShoping(cells: Shoping.setup())
            }

            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(
                width: collectionView.frame.width,
                height: collectionView.frame.height / Constatnts.helpSizeHeightShares
            )
        case 1:
            return CGSize(
                width: collectionView.frame.width,
                height: collectionView.frame.height / Constatnts.helpSizeHeightAdvertising
            )
        case 2:
            return CGSize(
                width: collectionView.frame.width,
                height: collectionView.frame.height / Constatnts.helpSizeHeightShoping
            )
        default:
            break
        }
        return CGSize()
    }
}

extension UIView {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        addGestureRecognizer(tapGesture)
    }
}

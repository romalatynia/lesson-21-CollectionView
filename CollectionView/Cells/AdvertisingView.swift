//
//  AdvertisingView.swift
//  CollectionView
//
//  Created by Harbros47 on 12.02.21.
//

import UIKit

private enum Constatnts {
    static let differenceSizeWidthCell: CGFloat = 5
    static let dividendSizeWidthCell: CGFloat = 2
}

class AdvertisingView: UICollectionViewCell {

    var advertisingCells = [Shares]()
    var advertisingCollectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let advertisingCollectionView = AdvertisingCollectionView(
            frame: CGRect(
                x: .zero,
                y: .zero,
                width: frame.width,
                height: frame.height
            )
        )
        advertisingCollectionView.delegate = self
        advertisingCollectionView.dataSource = self
        addSubview(advertisingCollectionView)
        self.advertisingCollectionView = advertisingCollectionView
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAdvertising(cells: [Shares]) {
        advertisingCells = cells
        advertisingCollectionView?.reloadData()
    }

}

extension AdvertisingView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        advertisingCells.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SharesCollectionViewCell.reuseId,
            for: indexPath) as? SharesCollectionViewCell
        cell?.mainImageView?.image = advertisingCells[indexPath.item].image
        
        return cell ?? UICollectionViewCell()
    }
}

extension AdvertisingView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        CGSize(
            width: (collectionView.frame.width - Constatnts.differenceSizeWidthCell) /
                Constatnts.dividendSizeWidthCell,
            height: collectionView.frame.height
        )
    }
}

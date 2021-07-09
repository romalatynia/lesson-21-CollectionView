//
//  AdvertisingCollectionView.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

class AdvertisingCollectionView: UICollectionView {
    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout )
        backgroundColor = .white
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        register(
            SharesCollectionViewCell.self,
            forCellWithReuseIdentifier: SharesCollectionViewCell.reuseId
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

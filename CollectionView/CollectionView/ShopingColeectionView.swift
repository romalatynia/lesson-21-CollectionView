//
//  ShopingColeectionView.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

class ShopingColeectionView: UICollectionView {
    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout )
        backgroundColor = .white
        layout.minimumLineSpacing = 5
        register(
            ShopingCollectionViewCell.self,
            forCellWithReuseIdentifier: ShopingCollectionViewCell.reuseId
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

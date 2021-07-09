//
//  SharesCollectionView.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

class SharesCollectionView: UICollectionView {
    
    init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout )
        backgroundColor = .gray
        isPagingEnabled = true
        layout.minimumLineSpacing = .zero
        register(
            SharesCollectionViewCell.self,
            forCellWithReuseIdentifier: SharesCollectionViewCell.reuseId
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

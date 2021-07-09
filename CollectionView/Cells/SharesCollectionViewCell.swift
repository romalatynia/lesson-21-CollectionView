//
//  InformationCollectionViewCell.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

class SharesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "InformationCollectionViewCell"
    var mainImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageView = UIImageView(frame: bounds)
        addSubview(imageView)
        mainImageView = imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

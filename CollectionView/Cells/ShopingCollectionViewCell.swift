//
//  AdvertisingCollectionViewCell.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

private enum Constatnts {
    static let fontSize: CGFloat = 12
    static let helpValue: CGFloat = 5
    static let differenceSizeHeight: CGFloat = 50
    static let helpHeightPriceLabel: CGFloat = 10
    static let helpHeightNameLabel: CGFloat = 15
    static let helpOriginYPriceLabel: CGFloat = 20
}

class ShopingCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "AdvertisingCollectionViewCell"
    
    var mainImageView: UIImageView?
    var mainPriceLabel: UILabel?
    var mainNameLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageView = UIImageView(
            frame: CGRect(
                x: bounds.origin.x,
                y: bounds.origin.y,
                width: bounds.width,
                height: bounds.height - Constatnts.differenceSizeHeight
            )
        )
        imageView.autoresizingMask = [
            .flexibleHeight,
            .flexibleWidth
        ]
        imageView.backgroundColor = .blue
        addSubview(imageView)
        mainImageView = imageView
        
        let priceLabel = UILabel(
            frame: CGRect(
                x: bounds.origin.x + Constatnts.helpValue,
                y: imageView.frame.maxY + Constatnts.helpOriginYPriceLabel,
                width: bounds.width,
                height: Constatnts.helpHeightPriceLabel
            )
        )
        
        priceLabel.font = UIFont.systemFont(ofSize: Constatnts.fontSize, weight: .heavy)
        priceLabel.autoresizingMask = [
            .flexibleHeight,
            .flexibleWidth
        ]
        addSubview(priceLabel)
        mainPriceLabel = priceLabel

        let nameLabel = UILabel(
            frame: CGRect(
                x: bounds.origin.x + Constatnts.helpValue,
                y: priceLabel.frame.maxY + Constatnts.helpValue,
                width: bounds.width,
                height: Constatnts.helpHeightNameLabel
            )
        )
        nameLabel.autoresizingMask = [
            .flexibleHeight,
            .flexibleWidth
        ]
        nameLabel.font = UIFont.systemFont(ofSize: Constatnts.fontSize, weight: .light)
        nameLabel.textColor = .systemGray
        addSubview(nameLabel)
        mainNameLabel = nameLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

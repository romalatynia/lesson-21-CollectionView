//
//  ShopingView.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

private enum Constatnts {
    static let helpValue: CGFloat = 20
    static let fontSize: CGFloat = 16
    static let helpOriginXLabel: CGFloat = 5
    static let differenceSizeWidthCell: CGFloat = 30
    static let differenceSizeHeightCell: CGFloat = 10
    static let dividendSizeWidthCell: CGFloat = 4
    static let dividendSizeHeightCell: CGFloat = 2
    static let labelText = "Хиты продаж"
}

class ShopingView: UICollectionViewCell {
    
    private var shopingLabel: UILabel?
    private var shopingCells = [Phone]()
    private var shopingColeectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let shopingColeectionView = ShopingColeectionView(
            frame: CGRect(
                x: bounds.origin.x,
                y: bounds.origin.y + Constatnts.helpValue,
                width: bounds.width,
                height: bounds.height - Constatnts.helpValue
            )
        )
        shopingColeectionView.delegate = self
        shopingColeectionView.dataSource = self
        addSubview(shopingColeectionView)
        self.shopingColeectionView = shopingColeectionView
        
        let label = UILabel(
            frame: CGRect(
                x: bounds.origin.x + Constatnts.helpOriginXLabel,
                y: bounds.origin.y,
                width: bounds.width,
                height: Constatnts.helpValue
            )
        )
        label.autoresizingMask = [
            .flexibleHeight,
            .flexibleWidth
        ]
        label.font = UIFont.systemFont(ofSize: Constatnts.fontSize, weight: .bold)
        label.text = Constatnts.labelText
        addSubview(label)
        shopingLabel = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setShoping(cells: [Phone]) {
        shopingCells = cells
        shopingColeectionView?.reloadData()
    }
}

extension ShopingView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        shopingCells.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ShopingCollectionViewCell.reuseId,
            for: indexPath
        ) as? ShopingCollectionViewCell
        let shoping = shopingCells[indexPath.item]
        cell?.mainImageView?.image = shoping.image
        cell?.mainPriceLabel?.text = "\(shoping.price)"
        cell?.mainNameLabel?.text = shoping.name
        return cell ?? UICollectionViewCell()
    }
}

extension ShopingView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        CGSize(
            width: (collectionView.frame.width - Constatnts.differenceSizeWidthCell) /
                Constatnts.dividendSizeWidthCell,
            height: (collectionView.frame.height - Constatnts.differenceSizeHeightCell) /
                Constatnts.dividendSizeHeightCell
        )
    }
}

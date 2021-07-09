//
//  SharesView.swift
//  CollectionView
//
//  Created by Harbros47 on 11.02.21.
//

import UIKit

private enum Constants {
    static let labelText = "* условия акции внутри"
    static let helpValue: CGFloat = 2
    static let helpSizeShares: CGFloat = 30
    static let helpSizeValue: CGFloat = 8
    static let helpLabelSize: CGFloat = 5
    static let heightPageControl: CGFloat = 15
    static let heightLabel: CGFloat = 10
    static let helpValueWidthLabel: CGFloat = 3
}

class SharesView: UICollectionViewCell {
    
    private var sharesCells = [Shares]()
    private var informatioCollectionView: UICollectionView?
    private var sharesLabel: UILabel?
    private var pageControl: UIPageControl?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let informatioCollectionView = SharesCollectionView(
            frame: CGRect(
                x: .zero,
                y: .zero,
                width: bounds.width,
                height: bounds.height - Constants.helpSizeShares
            )
        )
        informatioCollectionView.delegate = self
        informatioCollectionView.dataSource = self
        addSubview(informatioCollectionView)
        
        self.informatioCollectionView = informatioCollectionView
        
        let pageControl = UIPageControl(
            frame: CGRect(
                x: (bounds.width - bounds.width / Constants.helpValue) / Constants.helpValue,
                y: informatioCollectionView.frame.maxY + Constants.helpSizeValue,
                width: bounds.width / Constants.helpValue,
                height: Constants.heightPageControl
            )
        )
        pageControl.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .blue
        pageControl.numberOfPages = Shares.setupShares().count
        addSubview(pageControl)
        self.pageControl = pageControl
        
        let label = UILabel(
            frame: CGRect(
                x: bounds.origin.x + Constants.helpLabelSize,
                y: informatioCollectionView.frame.maxY + Constants.helpLabelSize,
                width: bounds.width / Constants.helpValueWidthLabel,
                height: Constants.heightLabel
            )
        )
        label.autoresizingMask = [
            .flexibleHeight,
            .flexibleWidth
        ]
        label.font = UIFont.systemFont(ofSize: Constants.helpSizeValue, weight: .light)
        label.tintColor = .systemGray
        label.text = Constants.labelText
        addSubview(label)
        sharesLabel = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [Shares]) {
        sharesCells = cells
        informatioCollectionView?.reloadData()
    }
}
 
extension SharesView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        sharesCells.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SharesCollectionViewCell.reuseId,
            for: indexPath) as? SharesCollectionViewCell
        cell?.mainImageView?.image = sharesCells[indexPath.item].image
        
        return cell ?? UICollectionViewCell()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        
        pageControl?.currentPage = indexPath.item
    }
}

extension SharesView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

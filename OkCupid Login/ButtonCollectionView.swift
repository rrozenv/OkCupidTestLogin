//
//  ButtonCollectionView.swift
//  OkCupid Login
//
//  Created by Robert Rozenvasser on 4/29/17.
//  Copyright © 2017 Robert Rozenvasser. All rights reserved.
//

import Foundation
import UIKit

/*
class ButtonCollectionView: UICollectionView {
    let itemWidth: CGFloat = DeviceSize.viewWidth * (269/375)
    let itemHeight: CGFloat = DeviceSize.viewHeight * (45/667)
    fileprivate let layout: UICollectionViewFlowLayout!
    fileprivate var collectionView: UICollectionView!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        self.layout = layout as! UICollectionViewFlowLayout
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCollectionViewLayout() {
        let leftInset: CGFloat = DeviceSize.viewWidth * (53/375)
        let itemWidth = DeviceSize.viewWidth * (83/375)
        let itemHeight = DeviceSize.viewHeight * (45/667)
        birthYearCollViewLayout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: leftInset)
        birthYearCollViewLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        birthYearCollViewLayout.scrollDirection = .horizontal
    }
    
    fileprivate func setupCollectionView() {
        birthYearCollView.backgroundColor = UIColor.white
        birthYearCollView.allowsMultipleSelection = false
        birthYearCollView.showsHorizontalScrollIndicator = false
        birthYearCollView.delegate = self
        birthYearCollView.dataSource = self
        birthYearCollView.register(BirthYearCell.self, forCellWithReuseIdentifier: cellID)
        
        view.addSubview(birthYearCollView)
        birthYearCollView.translatesAutoresizingMaskIntoConstraints = false
        birthYearCollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        birthYearCollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        birthYearCollView.bottomAnchor.constraint(equalTo: birthYearLineDividerView.topAnchor, constant: -DeviceSize.viewHeight * (15/667)).isActive = true
        birthYearCollView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
    }

}
 */

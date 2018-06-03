//
//  SearchCollectionView.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class SearchCollectionView: UICollectionView {
    
    var searchResults : [TokoProduct]?
    
    init(with frame : CGRect){
        let layout = UICollectionViewFlowLayout.init()
        layout.estimatedItemSize = CGSize.init(width: Constants.screenWidth-40, height: Constants.screenWidth-40)
        //layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    func commonInit(){
        registerViewItems()
        self.dataSource = self
        self.delegate = self
    }
    
    func registerViewItems(){
        self.register(UINib.init(nibName: "SearchItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchItemCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchCollectionView : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfRows = 0
        if let productCount = searchResults?.count{
            numberOfRows = productCount
        }
        return numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchItemCollectionViewCell", for: indexPath) as! SearchItemCollectionViewCell
        cell.bindData(for: searchResults![indexPath.row])
        return cell
    }
}

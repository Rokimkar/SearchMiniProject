//
//  SearchCollectionView.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

protocol SearchCollectionViewProtocol {
    func loadMoreData()
}

class SearchCollectionView: UICollectionView {
    
    var dataDelegate : SearchCollectionViewProtocol?
    var searchResults : [TokoProductViewModel]?
    var isLoadMore = false
    
    init(with frame : CGRect){
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: Constants.screenWidth/2 - 6, height: Constants.screenWidth/2 + 50 )
        //layout.estimatedItemSize = CGSize.init(width: Constants.screenWidth - 12, height: Constants.screenWidth/2 + 40 )
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    func commonInit(){
        self.backgroundColor = .gray
        registerViewItems()
        self.dataSource = self
        self.delegate = self
    }
    
    func registerViewItems(){
        self.register(UINib.init(nibName: "SearchItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchItemCollectionViewCell")
        self.register(UINib.init(nibName: "LoadMoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LoadMoreCollectionViewCell")
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
        if isLoadMore == true{
            numberOfRows+=1
        }
        return numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if searchResults?.count == indexPath.row{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoadMoreCollectionViewCell", for: indexPath) as! LoadMoreCollectionViewCell
            cell.bindData()
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchItemCollectionViewCell", for: indexPath) as! SearchItemCollectionViewCell
        cell.bindData(for: searchResults![indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleCells = self.visibleCells
        for cell in visibleCells{
            if cell.isKind(of: LoadMoreCollectionViewCell.self){
                dataDelegate?.loadMoreData()
            }
        }
    }
    
}

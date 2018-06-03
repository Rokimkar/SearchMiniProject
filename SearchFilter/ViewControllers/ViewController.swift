//
//  ViewController.swift
//  SearchFilter
//
//  Created by S@nchit on 31/05/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var searchCollectionView : SearchCollectionView?
    var searchDataService : SearchDataSevice?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchDataService = SearchDataSevice.init(query: "samsung", minPrice: 1000, maxPrice: 100000, wholeSale: true, official: true, fshop: 2, start:-10 , row: 10)
        fetchSearchResults(isLoadMore: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSearchCollectionView()
    }
    
    func setupSearchCollectionView(){
        if let _ = searchCollectionView{
            searchCollectionView?.frame = self.view.frame
        }else{
            searchCollectionView = SearchCollectionView.init(with: self.view.frame)
            searchCollectionView?.dataDelegate = self
            self.view.addSubview(searchCollectionView!)
        }
    }

    func fetchSearchResults(isLoadMore : Bool){
        searchDataService?.fetchSearchResults(query: "Samsung", isLoadMore: isLoadMore, success: { (productsArray,isLoadMoreAvailable) in
            if let _ = self.searchCollectionView{
                
            }else{
                self.setupSearchCollectionView()
            }
            
            if let _ = self.searchCollectionView?.searchResults{
                self.searchCollectionView!.searchResults?.append(contentsOf: productsArray)
            }else{
                self.searchCollectionView!.searchResults = productsArray
            }
            self.searchCollectionView?.isLoadMore = isLoadMoreAvailable
            self.searchCollectionView!.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    @IBAction func filterButtonPresssed(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : SearchCollectionViewProtocol{
    func loadMoreData() {
        fetchSearchResults(isLoadMore: true)
    }
}


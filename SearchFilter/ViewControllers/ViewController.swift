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

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSearchResults()
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
            self.view.addSubview(searchCollectionView!)
        }
        
    }
    
    func fetchSearchResults(){
        let request = SearchRequestEndPoint.init(query: "samsung", minPrice: 100, maxPrice: 1000000, wholeSale: true, official: true, fshop: 1, start:0 , row: 10)
        
        RouterManager.sharedInstance.fetchData(for: request, fetchType: .cache, success: { (searchData : SearchResponse) in
            if let _ = self.searchCollectionView{
                
            }else{
                self.setupSearchCollectionView()
            }
            self.searchCollectionView!.searchResults = searchData.data
            self.searchCollectionView!.reloadData()
        }) { (error) in
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


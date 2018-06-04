//
//  FilterViewController.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

protocol FilterChangeProtocol {
    func applyFilterChanges(with filter : SearchFilter)
}

class FilterViewController: UIViewController {
    
    var filterChangeDelegate : FilterChangeProtocol?
    var searchFilter = SearchFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupFilterTableView(){
        let filterTableView = FilterTableView.init(frame: CGRect.init(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight-85))
        filterTableView.parentController = self
        self.view.addSubview(filterTableView)
    }
    
    @IBAction func applyButtonClicked(_ sender: Any) {
        filterChangeDelegate?.applyFilterChanges(with: searchFilter)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FilterViewController : FilterPageProtocol{
    
    func reset() {
        searchFilter = SearchFilter()
    }
    
    func minPriceChanged(value: Int) {
        searchFilter.minPrice = value
    }
    
    func maxPriceChanged(value: Int) {
        searchFilter.maxPrice = value
    }
    
    func wholeSaleChanged(value: Bool) {
        searchFilter.wholeSale = value
    }
    
    func shopTypeChanged(type: ShopType) {
        switch type {
        case .official:
            searchFilter.fshop = 0
            break
        case .goldMerchant:
            searchFilter.fshop = 1
            break
        case .both:
            searchFilter.fshop = 2
            break
        }
    }
    
}

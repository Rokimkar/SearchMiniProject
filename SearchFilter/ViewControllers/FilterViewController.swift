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
    
    @IBOutlet weak var applyButton: UIButton!
    var filterChangeDelegate : FilterChangeProtocol?
    var searchFilter = SearchFilter()
    var filterTableView : FilterTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = filterTableView{
            
        }else{
            setupFilterTableView()
        }
        self.view.addSubview(filterTableView!)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filterTableView?.reloadData()
        if filterTableView?.tableType == .shopTypeTable{
            applyButton.isHidden = true
        }
    }
    
    func setupFilterTableView(){
        filterTableView = FilterTableView.init(frame: CGRect.init(x: 0, y: 20, width: Constants.screenWidth, height: Constants.screenHeight-105))
        filterTableView?.parentController = self
        
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
        if filterTableView?.tableType == .shopTypeTable{
            searchFilter.fshop = 2
            searchFilter.official = true
        }else{
            searchFilter = SearchFilter()
        }
        filterTableView?.reloadData()
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
    
    func officialShopTypeChanged(isSelected: Bool) {
        searchFilter.official = isSelected
    }
    
    func goldMerchantChanged(isSelected : Bool){
        if isSelected == true{
            searchFilter.fshop = 2
        }else{
            searchFilter.fshop = 0
        }
    }
    
}

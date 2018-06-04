//
//  FilterTableView.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class FilterTableView: UITableView {
    
    weak var parentController : FilterViewController?
    
    init(frame : CGRect){
        super.init(frame: frame, style: .plain)
        commonInit()
    }
    
    func commonInit(){
        self.dataSource = self
        self.delegate = self
        registerCells()
    }
    
    func registerCells(){
        self.register(UINib.init(nibName: "FilterHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterHeaderTableViewCell")
        self.register(UINib.init(nibName: "FilterBodyTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterBodyTableViewCell")
        self.register(UINib.init(nibName: "ShopTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopTypeTableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterTableView : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterHeaderTableViewCell", for: indexPath) as! FilterHeaderTableViewCell
            cell.filterPageDelegate = parentController
            return cell
        }
        if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterBodyTableViewCell", for: indexPath) as! FilterBodyTableViewCell
            cell.filterPageDelegate = parentController
            return cell
        }
        if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTypeTableViewCell", for: indexPath) as! ShopTypeTableViewCell
            cell.filterPageDelegate = parentController
            return cell
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 50.0
        if indexPath.row == 0{
            height = 100.0
        }
        if indexPath.row == 1{
            height = 100.0
        }
        if indexPath.row == 2{
            height = 100.0
        }
        return CGFloat(height)
    }
}

//
//  FilterViewController.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupFilterTableView(){
        let filterTableView = FilterTableView.init(frame: CGRect.init(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight))
        self.view.addSubview(filterTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

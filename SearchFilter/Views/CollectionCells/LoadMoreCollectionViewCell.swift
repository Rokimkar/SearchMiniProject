//
//  LoadMoreCollectionViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class LoadMoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var yConstraintIndicator: NSLayoutConstraint!
    @IBOutlet weak var xConstraintIndicator: NSLayoutConstraint!
    @IBOutlet weak var loadMoreIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(){
        //adjustIndicatorConstraint()
        loadMoreIndicator.startAnimating()
    }
    
    func adjustIndicatorConstraint(){
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        xConstraintIndicator.constant = Constants.screenWidth/2 - 20
        yConstraintIndicator.constant = 20
    }
    
}

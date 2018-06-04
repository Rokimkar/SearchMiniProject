//
//  SearchItemCollectionViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class SearchItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var itemImageViewWidthConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTitleLabel.numberOfLines = 0
        // Initialization code
    }
    
    func bindData(for searchItem : TokoProduct) {
        itemTitleLabel.text = searchItem.name
        itemPriceLabel.text = searchItem.price
        RouterManager.sharedInstance.bindImage(for: searchItem.imageUrl ?? "", with: itemImageView)
        updateImageViewConstraints()
    }
    
    func updateImageViewConstraints(){
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        itemImageViewWidthConstraint.constant = Constants.screenWidth/2 - 40
        itemImageViewHeightConstraint.constant = Constants.screenWidth/2 - 40
    }

}

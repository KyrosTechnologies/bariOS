//
//  DistributorListCell.swift
//  BarApp
//
//  Created by Apple on 5/15/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class DistributorListCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var distributorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

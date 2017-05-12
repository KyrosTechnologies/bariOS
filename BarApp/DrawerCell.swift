//
//  DrawerCell.swift
//  BarApp
//
//  Created by Apple on 5/5/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class DrawerCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

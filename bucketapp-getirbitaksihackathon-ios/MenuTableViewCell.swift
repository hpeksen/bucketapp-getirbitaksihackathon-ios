//
//  MenuTableViewCell.swift
//  bucketapp-getirbitaksihackathon-ios
//
//  Created by Apple on 25.03.2017.
//  Copyright © 2017 OnurCal. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

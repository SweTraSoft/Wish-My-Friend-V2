//
//  WishTableViewCell.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-12-19.
//

import UIKit

class WishTableViewCell: UITableViewCell {
    
    @IBOutlet var wishText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

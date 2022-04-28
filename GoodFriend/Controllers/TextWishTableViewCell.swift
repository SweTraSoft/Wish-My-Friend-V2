//
//  TextWishTableViewCell.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-02-27.
//

import UIKit

class TextWishTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textWish: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

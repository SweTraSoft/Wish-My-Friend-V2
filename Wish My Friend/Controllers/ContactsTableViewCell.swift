//
//  ContactsTableViewCell.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-30.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet var firstName: UILabel!
    @IBOutlet weak var contactPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

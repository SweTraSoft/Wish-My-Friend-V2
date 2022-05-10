//
//  ContactTableViewCell.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-10-18.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet var firstName: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet weak var personImagee: UIImageView!
    @IBOutlet var numberOfDays: UILabel!
    @IBOutlet weak var daysText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  SettingsViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-12-28.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var generalView: UIView!

    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstNamem: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var heightAdjustment: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        heightAdjustment.constant=0
        firstNamem.isHidden = true
        lastName.isHidden = true
        UIView.animate(withDuration: 1) {
                  self.view.layoutIfNeeded()
             }
    }
    
    @IBAction func expandView(_ sender: Any) {
        heightAdjustment.constant=100
        firstNamem.isHidden = false
        lastName.isHidden = false
        UIView.animate(withDuration: 1) {
                  self.view.layoutIfNeeded()
             }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  TextWishSortViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-03-04.
//

import UIKit

class TextWishSortViewController: UIViewController
{

    @IBOutlet weak var FamilyView: UIView!
    
    @IBOutlet weak var familySwitch: UISwitch!
    @IBOutlet weak var friendsSwitch: UISwitch!
    @IBOutlet weak var workSwitch: UISwitch!
    
    @IBOutlet weak var momButton: UIButton!
    var momButtonStatus = 0
    
    @IBOutlet weak var dadButton: UIButton!
    var dadButtonStatus = 0
    
    @IBOutlet weak var wifeButton: UIButton!
    var wifeButtonStatus = 0
    
    @IBOutlet weak var husbandButton: UIButton!
    var husbandButtonStatus = 0
    
    @IBOutlet weak var sonButton: UIButton!
    var sonButtonStatus = 0
    
    @IBOutlet weak var daughterButton: UIButton!
    var daughterButtonStatus = 0
    
    @IBOutlet weak var otherFamilyButton: UIButton!
    var otherFamilyButtonStatus = 0
    
    @IBOutlet weak var girlFriendButton: UIButton!
    var girlFriendButtonStatus = 0
    
    @IBOutlet weak var boyFriendButton: UIButton!
    var boyFriendButtonStatus = 0
    
    @IBOutlet weak var bestFriendButton: UIButton!
    var bestFriendButtonStatus = 0
    
    @IBOutlet weak var casualFriendButton: UIButton!
    var casualFriendButtonStatus = 0
    
    @IBOutlet weak var classMateButton: UIButton!
    var classMateButtonStatus = 0
    
    @IBOutlet weak var otherFriendButton: UIButton!
    var otherFriendButtonStatus = 0
    
    @IBOutlet weak var bossButton: UIButton!
    var bossButtonStatus = 0
    
    @IBOutlet weak var colleagueButton: UIButton!
    var colleagueButtonStatus = 0
    
    @IBOutlet weak var otherWorkButton: UIButton!
    var otherWorkButtonStatus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FamilyView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        
        familySwitch.setOn(false, animated: false)
        friendsSwitch.setOn(false, animated: false)
        workSwitch.setOn(false, animated: false)
     
        momButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        momButton.setTitleColor(UIColor.black, for: .normal)
        dadButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        dadButton.setTitleColor(UIColor.black, for: .normal)
        sonButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        sonButton.setTitleColor(UIColor.black, for: .normal)
        daughterButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        daughterButton.setTitleColor(UIColor.black, for: .normal)
        wifeButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        wifeButton.setTitleColor(UIColor.black, for: .normal)
        husbandButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        husbandButton.setTitleColor(UIColor.black, for: .normal)
        otherFamilyButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        otherFamilyButton.setTitleColor(UIColor.black, for: .normal)
        
        girlFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        girlFriendButton.setTitleColor(UIColor.black, for: .normal)
        boyFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        boyFriendButton.setTitleColor(UIColor.black, for: .normal)
        bestFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        bestFriendButton.setTitleColor(UIColor.black, for: .normal)
        casualFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        casualFriendButton.setTitleColor(UIColor.black, for: .normal)
        classMateButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        classMateButton.setTitleColor(UIColor.black, for: .normal)
        otherFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        otherFriendButton.setTitleColor(UIColor.black, for: .normal)
        
        
        bossButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        bossButton.setTitleColor(UIColor.black, for: .normal)
        colleagueButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        colleagueButton.setTitleColor(UIColor.black, for: .normal)
        otherWorkButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        otherWorkButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func familySwitchButtonToggle(_ sender: Any) {
        
        if familySwitch.isOn
        {
            momButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            dadButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            sonButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            daughterButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            wifeButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            husbandButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            otherFamilyButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            momButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            dadButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            sonButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            daughterButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            wifeButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            husbandButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            otherFamilyButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func friendsSwitchToggle(_ sender: Any) {
        if self.friendsSwitch.isOn
        {
            girlFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            boyFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            bestFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            casualFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            classMateButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            otherFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            girlFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            boyFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            bestFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            casualFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            classMateButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            otherFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func workSwitchToggle(_ sender: Any) {
        if self.workSwitch.isOn
        {
            bossButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            colleagueButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
            otherWorkButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            bossButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            colleagueButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
            otherWorkButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    @IBAction func momButtonPress(_ sender: Any) {
        if momButtonStatus == 0
        {
            //Activating mom filter for wishes
            self.momButtonStatus = 1
            self.momButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.momButtonStatus = 0
            self.momButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    
    @IBAction func dadButtonPress(_ sender: Any) {
        if dadButtonStatus == 0
        {
            //Activating dad filter for wishes
            self.dadButtonStatus = 1
            self.dadButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.dadButtonStatus = 0
            self.dadButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }

    }
    
    @IBAction func wifeButtonPress(_ sender: Any) {
        if wifeButtonStatus == 0
        {
            //Activating wife filter for wishes
            self.wifeButtonStatus = 1
            self.wifeButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.wifeButtonStatus = 0
            self.wifeButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }

    }
    
    @IBAction func husbandButtonPress(_ sender: Any) {
        if husbandButtonStatus == 0
        {
            //Activating husband filter for wishes
            self.husbandButtonStatus = 1
            self.husbandButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.husbandButtonStatus = 0
            self.husbandButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }

    }
    @IBAction func sonButtonPress(_ sender: Any) {
        if sonButtonStatus == 0
        {
            //Activating son filter for wishes
            self.sonButtonStatus = 1
            self.sonButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.sonButtonStatus = 0
            self.sonButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }

    }
    @IBAction func daughterButtonPress(_ sender: Any) {
        if daughterButtonStatus == 0
        {
            //Activating daughter filter for wishes
            self.daughterButtonStatus = 1
            self.daughterButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.daughterButtonStatus = 0
            self.daughterButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }

    }
    @IBAction func otherFamilyButtonPress(_ sender: Any) {
        if otherFamilyButtonStatus == 0
        {
            //Activating mom filter for wishes
            self.otherFamilyButtonStatus = 1
            self.otherFamilyButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.otherFamilyButtonStatus = 0
            self.otherFamilyButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    
    @IBAction func girlFriendButtonPress(_ sender: Any) {
        if girlFriendButtonStatus == 0
        {
            //Activating girlFriend filter for wishes
            self.girlFriendButtonStatus = 1
            self.girlFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.girlFriendButtonStatus = 0
            self.girlFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func boyFriendButtonPress(_ sender: Any) {
        if boyFriendButtonStatus == 0
        {
            //Activating boy friend filter for wishes
            self.boyFriendButtonStatus = 1
            self.boyFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.boyFriendButtonStatus = 0
            self.boyFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    @IBAction func bestFriendButtonPress(_ sender: Any) {
        if bestFriendButtonStatus == 0
        {
            //Activating bestFriend filter for wishes
            self.bestFriendButtonStatus = 1
            self.bestFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.bestFriendButtonStatus = 0
            self.bestFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func casualFriendButtonPress(_ sender: Any) {
        if casualFriendButtonStatus == 0
        {
            //Activating casualFriend filter for wishes
            self.casualFriendButtonStatus = 1
            self.casualFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.casualFriendButtonStatus = 0
            self.casualFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func classMateButtonPress(_ sender: Any) {
        if classMateButtonStatus == 0
        {
            //Activating classMate filter for wishes
            self.classMateButtonStatus = 1
            self.classMateButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.classMateButtonStatus = 0
            self.classMateButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func otherFriendButtonPress(_ sender: Any) {
        if otherFriendButtonStatus == 0
        {
            //Activating otherFriend filter for wishes
            self.otherFriendButtonStatus = 1
            self.otherFriendButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.otherFriendButtonStatus = 0
            self.otherFriendButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func bossButtonPress(_ sender: Any) {
        if bossButtonStatus == 0
        {
            //Activating boss filter for wishes
            self.bossButtonStatus = 1
            self.bossButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.bossButtonStatus = 0
            self.bossButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func colleagueButtonPress(_ sender: Any) {
        if colleagueButtonStatus == 0
        {
            //Activating colleague filter for wishes
            self.colleagueButtonStatus = 1
            self.colleagueButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.colleagueButtonStatus = 0
            self.colleagueButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
    @IBAction func otherWorkButtonPress(_ sender: Any) {
        if otherWorkButtonStatus == 0
        {
            //Activating otherWork filter for wishes
            self.otherWorkButtonStatus = 1
            self.otherWorkButton.tintColor = UIColor(red: 59, green: 89, blue: 152)
        }
        else
        {
            self.otherWorkButtonStatus = 0
            self.otherWorkButton.tintColor = UIColor(red: 231, green: 231,blue: 231)
        }
    }
    
}




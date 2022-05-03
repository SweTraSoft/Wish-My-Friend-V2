//
//  WishControllerViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-11-09.
//

import UIKit

class WishControllerViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var profileView: UIView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileBirthday: UILabel!
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet var wishTableView: UITableView!
    @IBOutlet weak var chineseZodiac: UIImageView!
    @IBOutlet weak var chineseZodiacLabel: UILabel!
    
    var selectedContact : FetchedContact?
    var json_wishes = [WishesStructure]()
    var result_wishes = [WishesStructure]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.layer.cornerRadius = 10
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        profileImage.image = selectedContact?.contactImage
        profileName.text = selectedContact?.firstName
        
        setZodiac(month: selectedContact!.birthMonth, date: selectedContact!.birthday)
        
        wishTableView.delegate = self
        wishTableView.dataSource = self
        
        let nib = UINib(nibName: "WishTableViewCell", bundle: nil)
        wishTableView.register(nib, forCellReuseIdentifier: "WishTableViewCell")
        json_wishes = WishesLoader().wishes
        result_wishes = json_wishes
        
        setChineseZodiac(year: selectedContact?.birthYear ?? 0)
    }
    
    func setZodiac(month: Int, date: Int)
    {
        if((month == 1 && date >= 20) || (month == 2 && date <= 18))
        {
            zodiacImage.image = UIImage(named: "aquarius")
            zodiacLabel.text = "Aquarius (Jan 20 - Feb 18)"
            }
            else if((month == 2 && date >= 19) || (month == 3 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "pisces")
                zodiacLabel.text = "Pisces (Feb 19 - Mar 20)"
            }
            else if((month == 3 && date >= 21) || (month == 4 && date <= 19))
            {
                zodiacImage.image = UIImage(named: "aries")
                zodiacLabel.text = "Aries (Mar 21 - Apr 19)"
            }
            else if((month == 4 && date >= 20) || (month == 5 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "taurus")
                zodiacLabel.text = "Taurus (Apr 20 - May 20)"
            }
            else if((month == 5 && date >= 21) || (month == 6 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "gemini")
                zodiacLabel.text = "Gemini (May 21 - Jun 20)"
            }
            else if((month == 6 && date >= 21) || (month == 7 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "cancer")
                zodiacLabel.text = "Cancer (Jun 21 - Jul 22)"
            }
            else if((month == 7 && date >= 22) || (month == 8 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "leo")
                zodiacLabel.text = "Leo (Jul 23 - Aug 22)"
            }
            else if((month == 8 && date >= 23) || (month == 9 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "virgo")
                zodiacLabel.text = "Virgo (Aug 23 - Sept 22)"
            }
            else if((month == 9 && date >= 23) || (month == 11 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "libra")
                zodiacLabel.text = "Libra (Sept 23 - Oct 22)"
            }
            else if((month == 10 && date >= 23) || (month == 11 && date <= 21))
            {
                zodiacImage.image = UIImage(named: "scorpio")
                zodiacLabel.text = "Scorpio (Oct 23 - Nov 21)"
            }
            else if((month == 11 && date >= 21) || (month == 12 && date <= 21))
            {
                zodiacImage.image = UIImage(named: "sagittarius")
                zodiacLabel.text = "Sagittarius (Nov 22 - Dec 21)"
            }
            else if((month == 12 && date >= 22) || (month == 1 && date <= 19))
            {
                zodiacImage.image = UIImage(named: "capricorn")
                zodiacLabel.text = "Capricorn (Dec 22 - Jan 19)"
            }
    }
    
    func setChineseZodiac(year: Int)
        {
            if(year == 0)
            {
                chineseZodiacLabel.text = ""
                chineseZodiac.image = UIImage(named: "notAvailable")
            }
            else if(year % 12 == 0)
            {
                chineseZodiac.image = UIImage(named: "monkey")
                chineseZodiacLabel.text = "Year of Monkey - \(year)"
            }
            else if(year % 12 == 1)
            {
                chineseZodiac.image = UIImage(named: "rooster")
                chineseZodiacLabel.text = "Year of Rooster - \(year)"
            }
            else if(year % 12 == 2)
            {
                chineseZodiac.image = UIImage(named: "dog")
                chineseZodiacLabel.text = "Year of Dog - \(year)"
            }
            else if(year % 12 == 3)
            {
                chineseZodiac.image = UIImage(named: "pig")
                chineseZodiacLabel.text = "Year of Pig - \(year)"
            }
            else if(year % 12 == 4)
            {
                chineseZodiac.image = UIImage(named: "rat")
                chineseZodiacLabel.text = "Year of Rat - \(year)"
            }
            else if(year % 12 == 5)
            {
                chineseZodiac.image = UIImage(named: "ox")
                chineseZodiacLabel.text = "Year of Ox - \(year)"
            }
            else if(year % 12 == 6)
            {
                chineseZodiac.image = UIImage(named: "tiger")
                chineseZodiacLabel.text = "Year of Tiger - \(year)"
            }
            else if(year % 12 == 7)
            {
                chineseZodiac.image = UIImage(named: "rabbit")
                chineseZodiacLabel.text = "Year of rabbit - \(year)"
            }
            else if(year % 12 == 8)
            {
                chineseZodiac.image = UIImage(named: "dragon")
                chineseZodiacLabel.text = "Year of dragon - \(year)"
            }
            else if(year % 12 == 9)
            {
                chineseZodiac.image = UIImage(named: "snake")
                chineseZodiacLabel.text = "Year of Snake - \(year)"
            }
            else if(year % 12 == 10)
            {
                chineseZodiac.image = UIImage(named: "horse")
                chineseZodiacLabel.text = "Year of Horse - \(year)"
            }
            else if(year % 12 == 11)
            {
                chineseZodiac.image = UIImage(named: "goat")
                chineseZodiacLabel.text = "Year of Goat - \(year)"
            }
            print("setChineseZodiac \(year)")
        }

}

extension WishControllerViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Some item selected in wish table view")
    }
}

extension WishControllerViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result_wishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eachWishCell = wishTableView.dequeueReusableCell(withIdentifier: "WishTableViewCell", for: indexPath) as! WishTableViewCell
        eachWishCell.wishText.text = result_wishes[indexPath.row].text
        return eachWishCell
    }
}

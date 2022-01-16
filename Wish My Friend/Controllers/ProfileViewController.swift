//
//  ProfileViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-12-28.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var selectedContact : FetchedContact?
    var westernZodiacInfo = [WesternZodiacStructure]()
    var chineseZodiacInfo = [ChineseZodiacStructure]()
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var profileView: UIView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileBirthday: UILabel!
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!

    @IBOutlet weak var chineseZodiac: UIImageView!
    @IBOutlet weak var chineseZodiacLabel: UILabel!
    
    @IBOutlet weak var westernZodiacStrengths: UILabel!
    @IBOutlet weak var westernZodiacLikes: UILabel!
    @IBOutlet weak var westernZodiacDislikes: UILabel!
    @IBOutlet weak var westernZodiacWeaknesses: UILabel!
    @IBOutlet weak var chineseZodiacPrediction: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = 10
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        profileImage.image = selectedContact?.contactImage
        profileName.text = selectedContact?.firstName
        
        profileBirthday.text = "celebrates birthday on "+getMonthText(month: selectedContact!.birthMonth)+" "+String(selectedContact!.birthday)
        
        //Load western zodiac info from Json
        westernZodiacInfo = WesternZodiacLoader().westernZodiac
        
        //Load chinese zodiac info from Json
        chineseZodiacInfo = ChineseZodiacLoader().chineseZodiac
        
        setZodiac(month: selectedContact!.birthMonth, date: selectedContact!.birthday)
        setChineseZodiac(year: selectedContact?.birthYear ?? 0)
        
        
    }
    func getMonthText(month: Int) -> String
    {
        switch month {
        case 1:
            return "Jan"
        case 2:
             return "Feb"
        case 3:
             return "Mar"
        case 4:
             return "Apr"
        case 5:
             return "May"
        case 6:
             return "Jun"
        case 7:
             return "Jul"
        case 8:
             return "Aug"
        case 9:
             return "Sep"
        case 10:
             return "Oct"
        case 11:
             return "Nov"
        case 12:
             return "Dec"
        default:
            return "NAN"
        }
    }
    //To set english zodiac picture and text
    func setZodiac(month: Int, date: Int)
    {
        if((month == 1 && date >= 20) || (month == 2 && date <= 18))
        {
            zodiacImage.image = UIImage(named: "aquarius")
            zodiacLabel.text = "Aquarius (Jan 20 - Feb 18)"
            westernZodiacLikes.text = westernZodiacInfo[0].Likes
            westernZodiacStrengths.text = westernZodiacInfo[0].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[0].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[0].Weaknesses
        }
            else if((month == 2 && date >= 19) || (month == 3 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "pisces")
                zodiacLabel.text = "Pisces (Feb 19 - Mar 20)"
                westernZodiacLikes.text = westernZodiacInfo[1].Likes
                westernZodiacStrengths.text = westernZodiacInfo[1].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[1].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[1].Weaknesses
            }
            else if((month == 3 && date >= 21) || (month == 4 && date <= 19))
            {
                zodiacImage.image = UIImage(named: "aries")
                zodiacLabel.text = "Aries (Mar 21 - Apr 19)"
                westernZodiacLikes.text = westernZodiacInfo[2].Likes
                westernZodiacStrengths.text = westernZodiacInfo[2].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[2].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[2].Weaknesses
            }
            else if((month == 4 && date >= 20) || (month == 5 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "taurus")
                zodiacLabel.text = "Taurus (Apr 20 - May 20)"
                westernZodiacLikes.text = westernZodiacInfo[3].Likes
                westernZodiacStrengths.text = westernZodiacInfo[3].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[3].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[3].Weaknesses
            }
            else if((month == 5 && date >= 21) || (month == 6 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "gemini")
                zodiacLabel.text = "Gemini (May 21 - Jun 20)"
                westernZodiacLikes.text = westernZodiacInfo[4].Likes
                westernZodiacStrengths.text = westernZodiacInfo[4].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[4].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[4].Weaknesses
            }
            else if((month == 6 && date >= 21) || (month == 7 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "cancer")
                zodiacLabel.text = "Cancer (Jun 21 - Jul 22)"
                westernZodiacLikes.text = westernZodiacInfo[5].Likes
                westernZodiacStrengths.text = westernZodiacInfo[5].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[5].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[5].Weaknesses
            }
            else if((month == 7 && date >= 22) || (month == 8 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "leo")
                zodiacLabel.text = "Leo (Jul 23 - Aug 22)"
                westernZodiacLikes.text = westernZodiacInfo[6].Likes
                westernZodiacStrengths.text = westernZodiacInfo[6].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[6].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[6].Weaknesses
            }
            else if((month == 8 && date >= 23) || (month == 9 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "virgo")
                zodiacLabel.text = "Virgo (Aug 23 - Sept 22)"
                westernZodiacLikes.text = westernZodiacInfo[7].Likes
                westernZodiacStrengths.text = westernZodiacInfo[7].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[7].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[7].Weaknesses
            }
            else if((month == 9 && date >= 23) || (month == 11 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "libra")
                zodiacLabel.text = "Libra (Sept 23 - Oct 22)"
                westernZodiacLikes.text = westernZodiacInfo[8].Likes
                westernZodiacStrengths.text = westernZodiacInfo[8].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[8].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[8].Weaknesses
            }
            else if((month == 10 && date >= 23) || (month == 11 && date <= 21))
            {
                zodiacImage.image = UIImage(named: "scorpio")
                zodiacLabel.text = "Scorpio (Oct 23 - Nov 21)"
                westernZodiacLikes.text = westernZodiacInfo[9].Likes
                westernZodiacStrengths.text = westernZodiacInfo[9].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[9].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[9].Weaknesses
            }
            else if((month == 11 && date >= 21) || (month == 12 && date <= 21))
            {
                zodiacImage.image = UIImage(named: "sagittarius")
                zodiacLabel.text = "Sagittarius (Nov 22 - Dec 21)"
                westernZodiacLikes.text = westernZodiacInfo[10].Likes
                westernZodiacStrengths.text = westernZodiacInfo[10].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[10].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[10].Weaknesses
            }
            else if((month == 12 && date >= 22) || (month == 1 && date <= 19))
            {
                zodiacImage.image = UIImage(named: "capricorn")
                zodiacLabel.text = "Capricorn (Dec 22 - Jan 19)"
                westernZodiacLikes.text = westernZodiacInfo[11].Likes
                westernZodiacStrengths.text = westernZodiacInfo[11].Strengths
                westernZodiacDislikes.text = westernZodiacInfo[11].Dislikes
                westernZodiacWeaknesses.text = westernZodiacInfo[11].Weaknesses
            }
    }
    
    //To set chinese zodiac picture and text
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
                chineseZodiacPrediction.text = chineseZodiacInfo[8].pred1
            }
            else if(year % 12 == 1)
            {
                chineseZodiac.image = UIImage(named: "rooster")
                chineseZodiacLabel.text = "Year of Rooster - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[9].pred1
            }
            else if(year % 12 == 2)
            {
                chineseZodiac.image = UIImage(named: "dog")
                chineseZodiacLabel.text = "Year of Dog - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[10].pred1
                
            }
            else if(year % 12 == 3)
            {
                chineseZodiac.image = UIImage(named: "pig")
                chineseZodiacLabel.text = "Year of Pig - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[11].pred1
            }
            else if(year % 12 == 4)
            {
                chineseZodiac.image = UIImage(named: "rat")
                chineseZodiacLabel.text = "Year of Rat - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[0].pred2
            }
            else if(year % 12 == 5)
            {
                chineseZodiac.image = UIImage(named: "ox")
                chineseZodiacLabel.text = "Year of Ox - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[1].pred1
            }
            else if(year % 12 == 6)
            {
                chineseZodiac.image = UIImage(named: "tiger")
                chineseZodiacLabel.text = "Year of Tiger - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[2].pred1+" "+chineseZodiacInfo[2].pred3
            }
            else if(year % 12 == 7)
            {
                chineseZodiac.image = UIImage(named: "rabbit")
                chineseZodiacLabel.text = "Year of rabbit - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[3].pred3
                
            }
            else if(year % 12 == 8)
            {
                chineseZodiac.image = UIImage(named: "dragon")
                chineseZodiacLabel.text = "Year of dragon - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[4].pred1+" "+chineseZodiacInfo[4].pred3
            }
            else if(year % 12 == 9)
            {
                chineseZodiac.image = UIImage(named: "snake")
                chineseZodiacLabel.text = "Year of Snake - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[5].pred2
            }
            else if(year % 12 == 10)
            {
                chineseZodiac.image = UIImage(named: "horse")
                chineseZodiacLabel.text = "Year of Horse - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[6].pred2
            }
            else if(year % 12 == 11)
            {
                chineseZodiac.image = UIImage(named: "goat")
                chineseZodiacLabel.text = "Year of Goat - \(year)"
                chineseZodiacPrediction.text = chineseZodiacInfo[7].pred1
            }
            print("setChineseZodiac \(year)")
        }

}


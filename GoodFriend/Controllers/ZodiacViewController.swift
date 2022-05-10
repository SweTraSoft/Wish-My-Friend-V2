//
//  ZodiacViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-23.
//

import UIKit

class ZodiacViewController: UIViewController {
    
    var zodiacId:Int = -1
    var westernZodiacInfo = [EnglishZodiacStructure]()
    var chineseZodiacInfo = [ChineseZodiacStructure]()
    
    @IBOutlet weak var strengthsView: UIView!
    @IBOutlet weak var weaknessesView: UIView!
    @IBOutlet weak var likesView: UIView!
    @IBOutlet weak var dislikesView: UIView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var westernZodiacLikes: UILabel!
    @IBOutlet weak var westernZodiacStrengths: UILabel!
    @IBOutlet weak var westernZodiacWeaknesses: UILabel!
    @IBOutlet weak var westernZodiacDislikes: UILabel!
    @IBOutlet weak var westernZodiacText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strengthsView.layer.cornerRadius = 5
        weaknessesView.layer.cornerRadius = 5
        likesView.layer.cornerRadius = 5
        dislikesView.layer.cornerRadius = 5
        textView.layer.cornerRadius = 5
        
        //Load western zodiac info from Json
        westernZodiacInfo = EnglishZodiacLoader().englishZodiac
        
        //Load chinese zodiac info from Json
        chineseZodiacInfo = ChineseZodiacLoader().chineseZodiac
        
        setZodiac(zodiacId: zodiacId)
    }
    
    //To set english zodiac picture and text
    func setZodiac(zodiacId: Int)
    {
        if(zodiacId == 0)
        {
            zodiacImage.image = UIImage(named: "aquarius")
            zodiacLabel.text = "Aquarius (Jan 20 - Feb 18)"
            westernZodiacLikes.text = westernZodiacInfo[0].Likes
            westernZodiacStrengths.text = westernZodiacInfo[0].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[0].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[0].Weaknesses
            westernZodiacText.text = westernZodiacInfo[0].Text
        }
        else if(zodiacId == 1)
        {
            zodiacImage.image = UIImage(named: "pisces")
            zodiacLabel.text = "Pisces (Feb 19 - Mar 20)"
            westernZodiacLikes.text = westernZodiacInfo[1].Likes
            westernZodiacStrengths.text = westernZodiacInfo[1].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[1].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[1].Weaknesses
            westernZodiacText.text = westernZodiacInfo[1].Text
        }
        else if(zodiacId == 2)
        {
            zodiacImage.image = UIImage(named: "aries")
            zodiacLabel.text = "Aries (Mar 21 - Apr 19)"
            westernZodiacLikes.text = westernZodiacInfo[2].Likes
            westernZodiacStrengths.text = westernZodiacInfo[2].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[2].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[2].Weaknesses
            westernZodiacText.text = westernZodiacInfo[2].Text
        }
        else if(zodiacId == 3)
        {
            zodiacImage.image = UIImage(named: "taurus")
            zodiacLabel.text = "Taurus (Apr 20 - May 20)"
            westernZodiacLikes.text = westernZodiacInfo[3].Likes
            westernZodiacStrengths.text = westernZodiacInfo[3].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[3].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[3].Weaknesses
            westernZodiacText.text = westernZodiacInfo[3].Text
        }
        else if(zodiacId == 4)
        {
            zodiacImage.image = UIImage(named: "gemini")
            zodiacLabel.text = "Gemini (May 21 - Jun 20)"
            westernZodiacLikes.text = westernZodiacInfo[4].Likes
            westernZodiacStrengths.text = westernZodiacInfo[4].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[4].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[4].Weaknesses
            westernZodiacText.text = westernZodiacInfo[4].Text
        }
        else if(zodiacId == 5)
        {
            zodiacImage.image = UIImage(named: "cancer")
            zodiacLabel.text = "Cancer (Jun 21 - Jul 22)"
            westernZodiacLikes.text = westernZodiacInfo[5].Likes
            westernZodiacStrengths.text = westernZodiacInfo[5].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[5].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[5].Weaknesses
            westernZodiacText.text = westernZodiacInfo[5].Text
        }
        else if(zodiacId == 6)
        {
            zodiacImage.image = UIImage(named: "leo")
            zodiacLabel.text = "Leo (Jul 23 - Aug 22)"
            westernZodiacLikes.text = westernZodiacInfo[6].Likes
            westernZodiacStrengths.text = westernZodiacInfo[6].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[6].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[6].Weaknesses
            westernZodiacText.text = westernZodiacInfo[6].Text
        }
        else if(zodiacId == 7)
        {
            zodiacImage.image = UIImage(named: "virgo")
            zodiacLabel.text = "Virgo (Aug 23 - Sept 22)"
            westernZodiacLikes.text = westernZodiacInfo[7].Likes
            westernZodiacStrengths.text = westernZodiacInfo[7].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[7].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[7].Weaknesses
            westernZodiacText.text = westernZodiacInfo[7].Text
        }
        else if(zodiacId == 8)
        {
            zodiacImage.image = UIImage(named: "libra")
            zodiacLabel.text = "Libra (Sept 23 - Oct 22)"
            westernZodiacLikes.text = westernZodiacInfo[8].Likes
            westernZodiacStrengths.text = westernZodiacInfo[8].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[8].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[8].Weaknesses
            westernZodiacText.text = westernZodiacInfo[8].Text
        }
        else if(zodiacId == 9)
        {
            zodiacImage.image = UIImage(named: "scorpio")
            zodiacLabel.text = "Scorpio (Oct 23 - Nov 21)"
            westernZodiacLikes.text = westernZodiacInfo[9].Likes
            westernZodiacStrengths.text = westernZodiacInfo[9].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[9].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[9].Weaknesses
            westernZodiacText.text = westernZodiacInfo[9].Text
        }
        else if(zodiacId == 10)
        {
            zodiacImage.image = UIImage(named: "sagittarius")
            zodiacLabel.text = "Sagittarius (Nov 22 - Dec 21)"
            westernZodiacLikes.text = westernZodiacInfo[10].Likes
            westernZodiacStrengths.text = westernZodiacInfo[10].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[10].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[10].Weaknesses
            westernZodiacText.text = westernZodiacInfo[10].Text
        }
        else if(zodiacId == 11)
        {
            zodiacImage.image = UIImage(named: "capricorn")
            zodiacLabel.text = "Capricorn (Dec 22 - Jan 19)"
            westernZodiacLikes.text = westernZodiacInfo[11].Likes
            westernZodiacStrengths.text = westernZodiacInfo[11].Strengths
            westernZodiacDislikes.text = westernZodiacInfo[11].Dislikes
            westernZodiacWeaknesses.text = westernZodiacInfo[11].Weaknesses
            westernZodiacText.text = westernZodiacInfo[11].Text
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

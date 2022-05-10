//
//  ZodiacViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-23.
//

import UIKit

class ZodiacViewController: UIViewController {
    
    var zodiacId:Int = -1
    var englishZodiacInfo = [EnglishZodiacStructure]()
    var chineseZodiacInfo = [ChineseZodiacStructure]()
    
    @IBOutlet weak var strengthsView: UIView!
    @IBOutlet weak var weaknessesView: UIView!
    @IBOutlet weak var likesView: UIView!
    @IBOutlet weak var dislikesView: UIView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var englishZodiacLikes: UILabel!
    @IBOutlet weak var englishZodiacStrengths: UILabel!
    @IBOutlet weak var englishZodiacWeaknesses: UILabel!
    @IBOutlet weak var englishZodiacDislikes: UILabel!
    @IBOutlet weak var englishZodiacText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strengthsView.layer.cornerRadius = 5
        weaknessesView.layer.cornerRadius = 5
        likesView.layer.cornerRadius = 5
        dislikesView.layer.cornerRadius = 5
        textView.layer.cornerRadius = 5
        
        //Load english zodiac info from Json
        englishZodiacInfo = EnglishZodiacLoader().englishZodiac
        
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
            englishZodiacLikes.text = englishZodiacInfo[0].Likes
            englishZodiacStrengths.text = englishZodiacInfo[0].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[0].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[0].Weaknesses
            englishZodiacText.text = englishZodiacInfo[0].Text
        }
        else if(zodiacId == 1)
        {
            zodiacImage.image = UIImage(named: "pisces")
            zodiacLabel.text = "Pisces (Feb 19 - Mar 20)"
            englishZodiacLikes.text = englishZodiacInfo[1].Likes
            englishZodiacStrengths.text = englishZodiacInfo[1].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[1].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[1].Weaknesses
            englishZodiacText.text = englishZodiacInfo[1].Text
        }
        else if(zodiacId == 2)
        {
            zodiacImage.image = UIImage(named: "aries")
            zodiacLabel.text = "Aries (Mar 21 - Apr 19)"
            englishZodiacLikes.text = englishZodiacInfo[2].Likes
            englishZodiacStrengths.text = englishZodiacInfo[2].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[2].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[2].Weaknesses
            englishZodiacText.text = englishZodiacInfo[2].Text
        }
        else if(zodiacId == 3)
        {
            zodiacImage.image = UIImage(named: "taurus")
            zodiacLabel.text = "Taurus (Apr 20 - May 20)"
            englishZodiacLikes.text = englishZodiacInfo[3].Likes
            englishZodiacStrengths.text = englishZodiacInfo[3].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[3].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[3].Weaknesses
            englishZodiacText.text = englishZodiacInfo[3].Text
        }
        else if(zodiacId == 4)
        {
            zodiacImage.image = UIImage(named: "gemini")
            zodiacLabel.text = "Gemini (May 21 - Jun 20)"
            englishZodiacLikes.text = englishZodiacInfo[4].Likes
            englishZodiacStrengths.text = englishZodiacInfo[4].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[4].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[4].Weaknesses
            englishZodiacText.text = englishZodiacInfo[4].Text
        }
        else if(zodiacId == 5)
        {
            zodiacImage.image = UIImage(named: "cancer")
            zodiacLabel.text = "Cancer (Jun 21 - Jul 22)"
            englishZodiacLikes.text = englishZodiacInfo[5].Likes
            englishZodiacStrengths.text = englishZodiacInfo[5].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[5].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[5].Weaknesses
            englishZodiacText.text = englishZodiacInfo[5].Text
        }
        else if(zodiacId == 6)
        {
            zodiacImage.image = UIImage(named: "leo")
            zodiacLabel.text = "Leo (Jul 23 - Aug 22)"
            englishZodiacLikes.text = englishZodiacInfo[6].Likes
            englishZodiacStrengths.text = englishZodiacInfo[6].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[6].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[6].Weaknesses
            englishZodiacText.text = englishZodiacInfo[6].Text
        }
        else if(zodiacId == 7)
        {
            zodiacImage.image = UIImage(named: "virgo")
            zodiacLabel.text = "Virgo (Aug 23 - Sept 22)"
            englishZodiacLikes.text = englishZodiacInfo[7].Likes
            englishZodiacStrengths.text = englishZodiacInfo[7].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[7].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[7].Weaknesses
            englishZodiacText.text = englishZodiacInfo[7].Text
        }
        else if(zodiacId == 8)
        {
            zodiacImage.image = UIImage(named: "libra")
            zodiacLabel.text = "Libra (Sept 23 - Oct 22)"
            englishZodiacLikes.text = englishZodiacInfo[8].Likes
            englishZodiacStrengths.text = englishZodiacInfo[8].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[8].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[8].Weaknesses
            englishZodiacText.text = englishZodiacInfo[8].Text
        }
        else if(zodiacId == 9)
        {
            zodiacImage.image = UIImage(named: "scorpio")
            zodiacLabel.text = "Scorpio (Oct 23 - Nov 21)"
            englishZodiacLikes.text = englishZodiacInfo[9].Likes
            englishZodiacStrengths.text = englishZodiacInfo[9].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[9].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[9].Weaknesses
            englishZodiacText.text = englishZodiacInfo[9].Text
        }
        else if(zodiacId == 10)
        {
            zodiacImage.image = UIImage(named: "sagittarius")
            zodiacLabel.text = "Sagittarius (Nov 22 - Dec 21)"
            englishZodiacLikes.text = englishZodiacInfo[10].Likes
            englishZodiacStrengths.text = englishZodiacInfo[10].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[10].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[10].Weaknesses
            englishZodiacText.text = englishZodiacInfo[10].Text
        }
        else if(zodiacId == 11)
        {
            zodiacImage.image = UIImage(named: "capricorn")
            zodiacLabel.text = "Capricorn (Dec 22 - Jan 19)"
            englishZodiacLikes.text = englishZodiacInfo[11].Likes
            englishZodiacStrengths.text = englishZodiacInfo[11].Strengths
            englishZodiacDislikes.text = englishZodiacInfo[11].Dislikes
            englishZodiacWeaknesses.text = englishZodiacInfo[11].Weaknesses
            englishZodiacText.text = englishZodiacInfo[11].Text
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

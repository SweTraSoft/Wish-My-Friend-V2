//
//  ChineseZodiacViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-23.
//

import UIKit

class ChineseZodiacViewController: UIViewController {
    
    var zodiacContentIndex: Int = -1
    @IBOutlet weak var chineseZodiacText: UITextView!

    
    @IBOutlet weak var chineseZodiac: UIImageView!
    
    @IBOutlet weak var chineseZodiacLabel: UILabel!
    
    var chineseZodiacInfo = [ChineseZodiacStructure]()
    
    var welcomeLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x:5, y:180, width: UIScreen.main.bounds.width-10, height: 100))
        lbl.text = "Sarath Chandra Damineni"
        lbl.font = .systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        lbl.backgroundColor = .cyan
        lbl.layer.cornerRadius = 10
        return lbl
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load chinese zodiac info from Json
        chineseZodiacInfo = ChineseZodiacLoader().chineseZodiac
        
        setChineseZodiac(index: zodiacContentIndex)
        
        if(zodiacContentIndex != -1)
        {
            var predictionText = ""
            
            if chineseZodiacInfo[zodiacContentIndex].pred1 != ""
            {
                predictionText = predictionText + chineseZodiacInfo[zodiacContentIndex].pred1
            }
  
            
            //Prediction 2
            if chineseZodiacInfo[zodiacContentIndex].pred2 != ""
            {
                predictionText = predictionText+"\n"+"\n"+chineseZodiacInfo[zodiacContentIndex].pred2
            }
            
            //Prediction 3
            if chineseZodiacInfo[zodiacContentIndex].pred3 != ""
            {
                predictionText = predictionText+"\n"+"\n"+chineseZodiacInfo[zodiacContentIndex].pred3
            }
            
            //Prediction 4
            if chineseZodiacInfo[zodiacContentIndex].pred4 != ""
            {
                predictionText = predictionText+"\n"+"\n"+chineseZodiacInfo[zodiacContentIndex].pred4
            }

            //Prediction 5
            if chineseZodiacInfo[zodiacContentIndex].pred5 != ""
            {
                predictionText = predictionText+"\n"+"\n"+chineseZodiacInfo[zodiacContentIndex].pred5
            }
            
            chineseZodiacText.text = predictionText
        }
        else
        {
            chineseZodiacText.text = "Chinese Zodiac sign not available since the year of the birth is not given for this contact"
        }
        
        
        
        
    }
    
    func setChineseZodiac(index: Int)
        {
            if(index == -1)
            {
                chineseZodiacLabel.text = "Not available"
                chineseZodiac.image = UIImage(named: "notAvailable")
            }
            else if(index == 8)
            {
                chineseZodiac.image = UIImage(named: "monkey")
                chineseZodiacLabel.text = "Year of Monkey"
            }
            else if(index == 9)
            {
                chineseZodiac.image = UIImage(named: "rooster")
                chineseZodiacLabel.text = "Year of Rooster"
            }
            else if(index == 10)
            {
                chineseZodiac.image = UIImage(named: "dog")
                chineseZodiacLabel.text = "Year of Dog"
                
            }
            else if(index == 11)
            {
                chineseZodiac.image = UIImage(named: "pig")
                chineseZodiacLabel.text = "Year of Pig"
            }
            else if(index == 12)
            {
                chineseZodiac.image = UIImage(named: "rat")
                chineseZodiacLabel.text = "Year of Rat"
            }
            else if(index == 1)
            {
                chineseZodiac.image = UIImage(named: "ox")
                chineseZodiacLabel.text = "Year of Ox"
            }
            else if(index == 2)
            {
                chineseZodiac.image = UIImage(named: "tiger")
                chineseZodiacLabel.text = "Year of Tiger"
            }
            else if(index == 3)
            {
                chineseZodiac.image = UIImage(named: "rabbit")
                chineseZodiacLabel.text = "Year of rabbit"
                
            }
            else if(index == 4)
            {
                chineseZodiac.image = UIImage(named: "dragon")
                chineseZodiacLabel.text = "Year of dragon"
            }
            else if(index == 5)
            {
                chineseZodiac.image = UIImage(named: "snake")
                chineseZodiacLabel.text = "Year of Snake"
            }
            else if(index == 6)
            {
                chineseZodiac.image = UIImage(named: "horse")
                chineseZodiacLabel.text = "Year of Horse"
            }
            else if(index == 7)
            {
                chineseZodiac.image = UIImage(named: "goat")
                chineseZodiacLabel.text = "Year of Goat"
            }
        }
    
    func adjustUITextViewHeight(arg : UITextView) {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
}

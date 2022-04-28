//
//  ProfileViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-12-28.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedContact : FetchedContact?
    var zodiacId: Int = -1
    var chineseZodiacContent: Int = -1
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var profileView: UIView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileBirthday: UILabel!
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!

    @IBOutlet weak var chineseZodiac: UIImageView!
    @IBOutlet weak var chineseZodiacLabel: UILabel!
    
    @IBOutlet weak var westernZodiacInfo: UIButton!
    @IBOutlet weak var chineseZodiacInfo: UIButton!
    
    //Table view for text wishes
    @IBOutlet weak var textWishesTableView: UITableView!
    
    //Select the category of relations to sort the text wishes
    @IBOutlet weak var selectCategory: UIButton!
    
    //variable for all text wishes
    var textWishes = [WishesStructure]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = 10
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        profileImage.image = selectedContact?.contactImage
        profileName.text = selectedContact?.firstName
        
        profileBirthday.text = "celebrates birthday on "+getMonthText(month: selectedContact!.birthMonth)+" "+String(selectedContact!.birthday)
        
        zodiacId = setZodiac(month: selectedContact!.birthMonth, date: selectedContact!.birthday)
        chineseZodiacContent = setChineseZodiac(year: selectedContact?.birthYear ?? 0)
        
        westernZodiacInfo.setTitle("", for: .normal)
        chineseZodiacInfo.setTitle("", for: .normal)
        
        let nib = UINib(nibName: "TextWishTableViewCell", bundle: nil)
        textWishesTableView.register(nib, forCellReuseIdentifier: "TextWish")
        textWishesTableView.delegate = self
        textWishesTableView.dataSource = self
        
        //Extracting all json wishes
        textWishes = WishesLoader().wishes
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Need to implement functionality to share the text")
        let ac = UIActivityViewController(activityItems: [textWishes[indexPath.row].text ?? "Default text wishes"], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        
        //TextWishCategorySelection.instance.showFilters()
       // showAlertToSelectCategory()
    }
    
    
    func showAlertToSelectCategory()
    {
        let alert = UIAlertController(title: "select categories", message: "please select to category to filter the wishes", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: {
            action in print("select tapped")
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
            print("Selected dismiss")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {
            action in print("Selected cancel")
        }))
        
        alert.view.addSubview(createSwitchForCategory())
        present(alert, animated: true)
    }
    
    
    func createSwitchForCategory() -> UISwitch
    {
        let switchControl = UISwitch(frame: CGRect(x: 10,y: 20,width: 0,height: 0))
        switchControl.isOn = false
        switchControl.setOn(true, animated: false)
        switchControl.addTarget(self, action: Selector(("switchValueDidChange")), for: .valueChanged)
        return switchControl
    }
    
    @objc func switchValueDidChange(sender: UISwitch!)
    {
        //print("Switch value is : \(sender.isOn)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textWishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextWish", for: indexPath) as! TextWishTableViewCell
        cell.textWish?.text = textWishes[indexPath.row].text
        cell.layer.cornerRadius = 5
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.destination is ZodiacViewController
        {
            let svc = segue.destination as! ZodiacViewController
            svc.zodiacId = zodiacId
        }
        else if segue.destination is ChineseZodiacViewController
        {
            let svc = segue.destination as! ChineseZodiacViewController
            svc.zodiacContentIndex = chineseZodiacContent
        }
        else
        {
            print("Hi")
        }
    }
    
    @IBAction func westernZodiacInfoClick(_ sender: Any)
    {
        performSegue(withIdentifier: "ZodiacViewController", sender: zodiacId)
    }
    
    @IBAction func chineseZodiacInfoClick(_ sender: Any)
    {
        performSegue(withIdentifier: "ChineseZodiacViewController", sender: zodiacId)
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
    func setZodiac(month: Int, date: Int) -> Int
    {
        if((month == 1 && date >= 20) || (month == 2 && date <= 18))
        {
            zodiacImage.image = UIImage(named: "aquarius")
            zodiacLabel.text = "Aquarius"
            return 0
        }
            else if((month == 2 && date >= 19) || (month == 3 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "pisces")
                zodiacLabel.text = "Pisces"
                return 1
            }
            else if((month == 3 && date >= 21) || (month == 4 && date <= 19))
            {
                zodiacImage.image = UIImage(named: "aries")
                zodiacLabel.text = "Aries"
                return 2
            }
            else if((month == 4 && date >= 20) || (month == 5 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "taurus")
                zodiacLabel.text = "Taurus"
                return 3
            }
            else if((month == 5 && date >= 21) || (month == 6 && date <= 20))
            {
                zodiacImage.image = UIImage(named: "gemini")
                zodiacLabel.text = "Gemini"
                return 4
            }
            else if((month == 6 && date >= 21) || (month == 7 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "cancer")
                zodiacLabel.text = "Cancer"
                return 5
            }
            else if((month == 7 && date >= 22) || (month == 8 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "leo")
                zodiacLabel.text = "Leo"
                return 6
            }
            else if((month == 8 && date >= 23) || (month == 9 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "virgo")
                zodiacLabel.text = "Virgo"
                return 7
            }
            else if((month == 9 && date >= 23) || (month == 11 && date <= 22))
            {
                zodiacImage.image = UIImage(named: "libra")
                zodiacLabel.text = "Libra"
                return 8
            }
            else if((month == 10 && date >= 23) || (month == 11 && date <= 21))
            {
                zodiacImage.image = UIImage(named: "scorpio")
                zodiacLabel.text = "Scorpio"
                return 9
            }
            else if((month == 11 && date >= 21) || (month == 12 && date <= 21))
            {
                zodiacImage.image = UIImage(named: "sagittarius")
                zodiacLabel.text = "Sagittarius"
                return 10
            }
            else if((month == 12 && date >= 22) || (month == 1 && date <= 19))
            {
                zodiacImage.image = UIImage(named: "capricorn")
                zodiacLabel.text = "Capricorn"
                return 11
            }
        else{
            return -1
        }
    }
    
    //To set chinese zodiac picture and text
    //Function returns the index of the array that has the text content of chinese zodiac view
    func setChineseZodiac(year: Int) -> Int
        {
            if(year == 0)
            {
                chineseZodiacLabel.text = ""
                chineseZodiac.image = UIImage(named: "notAvailable")
                return -1
            }
            else if(year % 12 == 0)
            {
                chineseZodiac.image = UIImage(named: "monkey")
                chineseZodiacLabel.text = "Year of Monkey - \(year)"
                return 8
            }
            else if(year % 12 == 1)
            {
                chineseZodiac.image = UIImage(named: "rooster")
                chineseZodiacLabel.text = "Year of Rooster - \(year)"
                return 9
            }
            else if(year % 12 == 2)
            {
                chineseZodiac.image = UIImage(named: "dog")
                chineseZodiacLabel.text = "Year of Dog - \(year)"
                return 10
                
            }
            else if(year % 12 == 3)
            {
                chineseZodiac.image = UIImage(named: "pig")
                chineseZodiacLabel.text = "Year of Pig - \(year)"
                return 11
            }
            else if(year % 12 == 4)
            {
                chineseZodiac.image = UIImage(named: "rat")
                chineseZodiacLabel.text = "Year of Rat - \(year)"
                return 12
            }
            else if(year % 12 == 5)
            {
                chineseZodiac.image = UIImage(named: "ox")
                chineseZodiacLabel.text = "Year of Ox - \(year)"
                return 1
            }
            else if(year % 12 == 6)
            {
                chineseZodiac.image = UIImage(named: "tiger")
                chineseZodiacLabel.text = "Year of Tiger - \(year)"
                return 2
            }
            else if(year % 12 == 7)
            {
                chineseZodiac.image = UIImage(named: "rabbit")
                chineseZodiacLabel.text = "Year of rabbit - \(year)"
                return 3
                
            }
            else if(year % 12 == 8)
            {
                chineseZodiac.image = UIImage(named: "dragon")
                chineseZodiacLabel.text = "Year of dragon - \(year)"
                return 4
            }
            else if(year % 12 == 9)
            {
                chineseZodiac.image = UIImage(named: "snake")
                chineseZodiacLabel.text = "Year of Snake - \(year)"
                return 5
            }
            else if(year % 12 == 10)
            {
                chineseZodiac.image = UIImage(named: "horse")
                chineseZodiacLabel.text = "Year of Horse - \(year)"
                return 6
            }
            else if(year % 12 == 11)
            {
                chineseZodiac.image = UIImage(named: "goat")
                chineseZodiacLabel.text = "Year of Goat - \(year)"
                return 7
            }
            else
            {
                return -1
            }
        }

}


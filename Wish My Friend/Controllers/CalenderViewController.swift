//
//  CalenderViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-11-14.
//

import UIKit


class CalenderViewController: UIViewController {
    let months = ["January", "February", "March", "April", "May", "June", "July", "August","September", "October", "November", "Decemeber"]
    @IBOutlet weak var MonthSwitchRight: UIView!
    @IBOutlet weak var CurrentMonthShow: UILabel!
    @IBOutlet weak var MonthSwitchLeft: UIView!
    @IBOutlet var calenderCollectionView: UICollectionView!
    
    @IBOutlet weak var MonthSwitchView: UIView!
    var birthdaysOfMonth = [FetchedContact]()
    var birthdaysOfMonthDates = [Int]()
    
    
    var tempMonth: Int = 0
    
    //Array location of month
    var displayMonth: Int = 0
    
    //global variables for the date
    var cur_glb_date: Date? = nil
    var cur_glb_day: Int = 0
    var cur_glb_month: Int = 0
    var cur_glb_year: Int = 0

    @IBOutlet weak var birthdayTableView: UITableView!
    
    let columnLayout = ColumnFlowLayout(
            cellsPerRow: 7,
            minimumInteritemSpacing: 10,
            minimumLineSpacing: 10,
            sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calenderCollectionView.dataSource = self
        calenderCollectionView.delegate = self
        
        
        calenderCollectionView?.collectionViewLayout = columnLayout
        calenderCollectionView?.contentInsetAdjustmentBehavior = .always
        
        cur_glb_date = Date()
        cur_glb_day = (cur_glb_date?.get(.day))!
        cur_glb_month = cur_glb_date!.get(.month)
        cur_glb_year = (cur_glb_date?.get(.year))!
        
        tempMonth = cur_glb_month-1
        displayMonth = tempMonth
        
        let nib = UINib(nibName: "ContactTableViewCell", bundle: nil)
        birthdayTableView.register(nib, forCellReuseIdentifier: "ContactTableViewCell")
        
        getMonthData(month: cur_glb_month)
        
        CurrentMonthShow.text = months[displayMonth]
        
        let monthSwitchLeftGesture = UITapGestureRecognizer(target: self, action: #selector(self.monthDecrease))
        let monthSwitchRightGesture = UITapGestureRecognizer(target: self, action: #selector(self.monthIncrease))
        
        MonthSwitchLeft.addGestureRecognizer(monthSwitchLeftGesture)
        MonthSwitchRight.addGestureRecognizer(monthSwitchRightGesture)
        // Do any additional setup after loading the view.
        
        birthdayTableView.delegate = self
        birthdayTableView.dataSource = self
    }
    
    
    @objc func monthDecrease(sender: UITapGestureRecognizer)
    {
        birthdaysOfMonthDates.removeAll()
        tempMonth -= 1
        displayMonth = tempMonth%12
        CurrentMonthShow.text = months[abs(displayMonth%12)]
        print("month sections is ")
        print(GlobalVariables.monthSections)
        print("Month gonna decrease")
        
        getMonthData(month: abs(displayMonth%12)+1)
        calenderCollectionView.reloadData()
        birthdayTableView.reloadData()
        
    }
    
    @objc func monthIncrease(sender: UITapGestureRecognizer)
    {
        birthdaysOfMonthDates.removeAll()
        tempMonth += 1
        displayMonth = tempMonth%12
        CurrentMonthShow.text = months[abs(displayMonth%12)]
        print("Month gonna increase")
        
        getMonthData(month: abs(displayMonth%12)+1)
        calenderCollectionView.reloadData()
        birthdayTableView.reloadData()
    }

    //Returns weekday in Int
    //1 for sunday
    //2 for monday and so on
    //7 for saturday
    func getWeekDay(month: Int, day: Int, year: Int) -> Int
    {
        var dateComponents = DateComponents()
        dateComponents.year = 2021
        dateComponents.month = month
        dateComponents.day = day
        //Take users time zone
        dateComponents.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation() ?? "CET")
        
        dateComponents.hour = 0
        dateComponents.minute = 0
        
        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
        let someDateTime = userCalendar.date(from: dateComponents)
        
        return Calendar.current.component(.weekday, from: someDateTime!)
        
    }
    
    //function to calculate number of days should be moved to match the week day display
    //So that if month starts with
    //Monday then no need to move
    //Tuesday then move for one time
    //Wednesday then move for two times
    //Thursday then move for three times
    //Friday then move for four times
    //Saturday then move for five times
    //Sunday then dates should be moved six times
    func calculateNumberOfBufferDays(weekDay: Int) -> Int
    {
        switch weekDay
        {
        //Sunday
        case 1:
            return 6
        //Monday
        case 2:
            return 0
        //Tuesday
        case 3:
            return 1
        //Wednesday
        case 4:
            return 2
        //Thursday
        case 5:
            return 3
        //Friday
        case 6:
            return 4
        //Saturday
        case 7:
            return 5
        //Default value to avoid errors
        default:
            return 0
        }
    }
    
    func getMonthData(month: Int)
    {
        birthdaysOfMonth.removeAll()
        
        for monthData in GlobalVariables.monthSections
        {
            if monthData.month == month
            {
                for cell in monthData.cells
                {
                    birthdaysOfMonth.append(cell)
                }
                break
            }
        }
        for eachBirthday in birthdaysOfMonth
        {
            birthdaysOfMonthDates.append(eachBirthday.birthday)
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

extension CalenderViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Some date is selected")
    }
}

extension CalenderViewController: UICollectionViewDataSource
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dateComponents = DateComponents(year: cur_glb_year, month: displayMonth+1)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        let numOfBufferDays = calculateNumberOfBufferDays(weekDay: getWeekDay(month: displayMonth+1, day: 1, year: cur_glb_year))
        return numDays + numOfBufferDays
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarDayCollectionViewCell
        let numOfBufferDays = calculateNumberOfBufferDays(weekDay: getWeekDay(month: displayMonth+1, day: 1, year: cur_glb_year))
        
        if (indexPath.row + 1) - numOfBufferDays > 0
        {
            dayCell.dateText?.text = String((indexPath.row + 1) - numOfBufferDays)
        }
        else
        {
            dayCell.dateText?.text = ""
        }
        
        dayCell.backgroundColor = .white
        dayCell.layer.cornerRadius = 10
        if birthdaysOfMonthDates.contains((indexPath.row + 1) - numOfBufferDays)
        {
            dayCell.backgroundColor = UIColor(red: 59, green: 89, blue: 152)
        }
        
        return dayCell
    }
}

extension CalenderViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Table view in calender collection view")
    }
}

extension CalenderViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdaysOfMonth.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eachContactCell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        
        eachContactCell.firstName.text = birthdaysOfMonth[indexPath.row].firstName
        eachContactCell.phoneNumber.text = birthdaysOfMonth[indexPath.row].telephone
        eachContactCell.personImagee.image = birthdaysOfMonth[indexPath.row].contactImage
        eachContactCell.personImagee?.layer.cornerRadius = (eachContactCell.personImagee?.frame.size.width)! / 2
        eachContactCell.personImagee?.layer.masksToBounds = true
        eachContactCell.numberOfDays.text = "10"
        
        return eachContactCell
    }
}

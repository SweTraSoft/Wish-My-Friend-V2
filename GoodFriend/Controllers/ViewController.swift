//
//  ViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-10-17.
//

import UIKit
import Contacts
import UserNotifications

struct GlobalVariables
{
    static var monthSections = [MonthSection]()
}

class ViewController: UIViewController{

    //This static variable holds all contacts which later used by different classes
    static var allContacts = [FetchedContact]()
    
    var contacts = [FetchedContact]()
    
    let store = CNContactStore()
    var dateFormatChange = DateFormatChange()
    
    @IBOutlet var contactsTableView: UITableView!
    let names = ["Sarath","Chandra","Damineni"]
    
    
    //global variables for the date
    var cur_glb_date: Date? = nil
    var cur_glb_day: Int = 0
    var cur_glb_month: Int = 0
    var cur_glb_year: Int = 0
    var sortedContacts: [FetchedContact] = []
    //public var monthSections = [MonthSection]()
    
    //Contact selected to share the wish
    var contactSelected: FetchedContact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let nib = UINib(nibName: "ContactTableViewCell", bundle: nil)
        contactsTableView.register(nib, forCellReuseIdentifier: "ContactTableViewCell")
        let authorize = CNContactStore.authorizationStatus(for: .contacts)
        
        //creating the global current date and month variables
        cur_glb_date = Date()
        cur_glb_day = (cur_glb_date?.get(.day))!
        cur_glb_month = cur_glb_date!.get(.month)
        cur_glb_year = (cur_glb_date?.get(.year))!
        
        if authorize == .notDetermined
        {
            store.requestAccess(for: .contacts){ [self] (chk, error) in
                
                if error == nil
                {
                    //print("logs:: requesting and want to display contacts for first time")
                    getContactsData()
                    sortedContacts = sortFetchedContacts()
                    sortDatesWithRespectToCurDay()
                    sortedContacts = getWeekDayFromBirthDay()
                    createSections()
                }
                else
                      {
                    print("Contacts request is not accepted")
                }
            }
        }
        else if authorize == .authorized
        {
           // print("logs:: already authorized and now will only display")
            getContactsData()
            sortedContacts = sortFetchedContacts()
            //printContacts(contactsList: sortedContacts)
            sortedContacts = getWeekDayFromBirthDay()
            sortDatesWithRespectToCurDay()
            createSections()
        }
        else
        {
            print("Contacts request is denied previously")
        }
        
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge
                                                                          ,.sound], completionHandler: {success, error in
            if !success
            {
                print("error occured")
            }
            
        })
        
        scheduleNotification()
    }
    
    func printContacts(contactsList: [FetchedContact])
    {
        for i in contactsList
        {
            print("Log:: contactsName "+i.firstName+" "+i.lastName)
        }
    }
    //    Sorting the dates with respect to the current dates
    func sortDatesWithRespectToCurDay()
    {
        //print("logs:: sortDatesWRTCurrDays")
        let calendar = Calendar.current
        let date = Date()
        let cur_day = date.get(.day)
        let cur_month = date.get(.month)
        var number_of_days_removed:Int = 0
        let temp_contacts_sorted = sortedContacts
        
        for each_contact in temp_contacts_sorted
        {
            //If birthday is before current day then move to back of the list
            //WMF-15 if birthday is before 2 days of current day then display on top of list
            print("Log:: "+each_contact.firstName+" remaining days: "+String(each_contact.ramainingDays))
            
            if each_contact.ramainingDays < -2
            {
                //creating object for current day and month
                let to_day = NSDateComponents()
                to_day.day = cur_glb_day
                to_day.month = cur_glb_month
                to_day.year = cur_glb_year
                
                //creating the birthday components
                var birthday_components = NSDateComponents()
                
                birthday_components.day = each_contact.birthday
                birthday_components.month = each_contact.birthMonth
                //give the birthday year as current year since we are calculating the difference of days
                birthday_components.year = cur_glb_year + 1
                
                //calculating the number of days remained
                let calender = Calendar.current
                var tempContactChangeBirthday = each_contact
                
                tempContactChangeBirthday.ramainingDays = calender.dateComponents([.day], from: to_day as DateComponents, to: birthday_components as DateComponents).day ?? 999
                
                //upcoming birthday is next year flag set true
                tempContactChangeBirthday.upcomingBirthdayNextYear = true
                
                sortedContacts.append(tempContactChangeBirthday)
                number_of_days_removed = number_of_days_removed+1
            }
            
        }
            
        for i in 0..<number_of_days_removed
        {
            sortedContacts.remove(at: 0)
        }
        
        //print("logs:: length of sorted contacts "+String(sortedContacts.count))
    }
    
    // sort all the dae of births here
    func sortFetchedContacts() -> [FetchedContact]
    {
        //print("logs:: sortFetchedContacts()")
        //print("logs:: contacts lenght is "+String(contacts.count))
        let contact_unsorted = contacts
        var contact_sorted_temp: [FetchedContact] = []
            
        for month in 1...12
        {
            for day in 1...31
            {
                for each_contact in contact_unsorted
                {
                    if(each_contact.birthMonth == month)
                    {
                        if(each_contact.birthday == day)
                        {
                            contact_sorted_temp.append(each_contact)
                        }
                    }
                }
            }
        }
        
        print("logs:: sorted contacts lenght is "+String(contact_sorted_temp.count))
        return contact_sorted_temp
    }
    
    
    func getMonthText(month: Int) -> String
    {
        switch month {
        case 1:
            return "January"
        case 2:
             return "February"
        case 3:
             return "March"
        case 4:
             return "April"
        case 5:
             return "May"
        case 6:
             return "June"
        case 7:
             return "July"
        case 8:
             return "August"
        case 9:
             return "September"
        case 10:
             return "October"
        case 11:
             return "November"
        case 12:
             return "December"
        default:
            return "NAN"
        }
    }
    
    func getContactsData()
    {
        //print("logs:: getContactsData()")
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactBirthdayKey, CNContactImageDataKey, CNContactImageDataAvailableKey]
        
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do
        {
            try store.enumerateContacts(with: request,
                                        usingBlock: { (contact, stopPointer) in
                  
                //Creating default image for contact
                var contactImage = UIImage(named: "ProfilePic")
                
                //If contact has image then take the image of contact else show default image
                if contact.imageDataAvailable
                {
                    contactImage = UIImage(data: contact.imageData!)!
                }
                
                //Collecting all contacts to the static variable allContacts
                ViewController.allContacts.append(FetchedContact(firstName: contact.givenName,
                                                       lastName: contact.familyName,
                                                       telephone: contact.phoneNumbers.first?.value.stringValue ?? "",
                                                       birthday: contact.birthday?.day ?? 0,
                                                       birthMonth: contact.birthday?.month ?? 0,
                                                       birthYear: contact.birthday?.year ?? 0,
                                                       contactImage: contactImage!,
                                                                 
                                                                 // if dob is not available then current day is taken as dob
                                                                 birthdayDate: (contact.birthday?.date) ?? Date(),
                                                                 
                                                                 ramainingDays: self.calculateRemainingDays(day: contact.birthday?.day ?? 0, month: contact.birthday?.month ?? 0),
                                                                contact: contact,
                                                                weekDay: "Default",
                                                                upcomingBirthdayNextYear: false))
                
                //Further collect only contacts that has birthday associated with it
                                            if(contact.birthday != nil)
                                            {
                                        
                                                self.contacts.append(
                                                    FetchedContact(firstName: contact.givenName,
                                                                   lastName: contact.familyName,
                                                                   telephone: contact.phoneNumbers.first?.value.stringValue ?? "",
                                                                   birthday: contact.birthday?.day ?? 0,
                                                                   birthMonth: contact.birthday?.month ?? 0,
                                                                   birthYear: contact.birthday?.year ?? 0,
                                                                   contactImage: contactImage!,
                                                                   birthdayDate: (contact.birthday?.date)!,
                                                                   ramainingDays: self.calculateRemainingDays(day: contact.birthday?.day ?? 0, month: contact.birthday?.month ?? 0),
                                                                  contact: contact,
                                                                  weekDay: "Default",
                                                                  upcomingBirthdayNextYear: false)
                                                )
                                            }
                
                        })
        }
        catch let error
        {
            print("Failed to enumerate contact", error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let svc = segue.destination as! WishControllerViewController
        let svc = segue.destination as! ProfileViewController
        svc.selectedContact = contactSelected
    }
    
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactSelected = GlobalVariables.monthSections[indexPath.section].cells[indexPath.row]
        //performSegue(withIdentifier: "WishViewController", sender: contactSelected)
        performSegue(withIdentifier: "ProfileViewController", sender: contactSelected)
    }
    
}

extension ViewController: UITableViewDataSource
{

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        getMonthText(month: GlobalVariables.monthSections[section].month)
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        //print("logs:: number of sections "+String(GlobalVariables.monthSections.count))
        return GlobalVariables.monthSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariables.monthSections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eachContactCell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        
        
        //if the year is not available then age is not displayed after the name
        if GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].birthYear == 0
        {
            eachContactCell.firstName.text = GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].firstName + " " +
                                             GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].lastName
        }
        else
        {
            eachContactCell.firstName.text = GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].firstName + " " +
                                             GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].lastName+" ("+String(cur_glb_year-GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].birthYear)+")"
        }
        
        eachContactCell.phoneNumber.text = "Celebrates on "+dateFormatChange.monthShortHand(month: GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].birthMonth)+" "+dateFormatChange.dateSuperscript(date:  GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].birthday)+"("+dateFormatChange.shortWeekday(weekDay: GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].weekDay)+")"
        
        eachContactCell.personImagee.image = GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].contactImage
        eachContactCell.personImagee?.layer.cornerRadius = (eachContactCell.personImagee?.frame.size.width)! / 2
        eachContactCell.personImagee?.layer.masksToBounds = true
        eachContactCell.numberOfDays.text = String(GlobalVariables.monthSections[indexPath.section].cells[indexPath.row].ramainingDays)
        return eachContactCell
    }
    
    func getWeekDayFromBirthDay() -> [FetchedContact]
    {
        //creating object for current day and month
        let to_day = NSDateComponents()
        to_day.year = cur_glb_year
        var weekDayCalculatedContacts = [FetchedContact]()
        
        for eachContactSorted in sortedContacts
        {
            var eachContact = eachContactSorted
            
            let contactBirthday = eachContact.birthday
            let contactBirthMonth = eachContact.birthMonth
            let contactBirthYear = cur_glb_year
            
            if eachContact.upcomingBirthdayNextYear == true
            {
                let contactBirthYear = cur_glb_year + 1
            }
            
            var dateComponents = DateComponents()
            dateComponents.day = contactBirthday
            dateComponents.month = contactBirthMonth
            dateComponents.year = contactBirthYear
            // Create date from components
            let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
            let dateTime = userCalendar.date(from: dateComponents)
            let dateFormatter = DateFormatter()
            eachContact.weekDay = dateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: dateTime!) - 1]
            
            print("Log:: "+eachContact.firstName+" Weekday: "+eachContact.weekDay)
            weekDayCalculatedContacts.append(eachContact)
        }
        return weekDayCalculatedContacts
    }
    
    func calculateRemainingDays(day: Int, month: Int) -> Int
        {
            //creating object for current day and month
            let to_day = NSDateComponents()
            to_day.day = cur_glb_day
            to_day.month = cur_glb_month
            to_day.year = cur_glb_year
            
            //creating the birthday components
            var birthday_components = NSDateComponents()
            birthday_components.day = day
            birthday_components.month = month
            
            
            //give the birthday year as current year since we are calculating the difference of days
            birthday_components.year = cur_glb_year
                
            //calculating the number of days remained
            let calender = Calendar.current
            var components = calender.dateComponents([.day], from: to_day as DateComponents, to: birthday_components as DateComponents)
             
            //if birthday for current year is already completed then remaining number for next birthday will be calculated
            /*if(components.day ?? 0 < -2)
            {
                birthday_components.year = cur_glb_year + 1
                components = calender.dateComponents([.day], from: to_day as DateComponents, to: birthday_components as DateComponents)
            }*/
            
            return components.day ?? 999
            
        }
    
    //    to create the sections of months for the contacts sorted
    func createSections()
    {
        //print("logs:: createSections()")
        var prev_month = sortedContacts[0].birthMonth
        var temp_section_contacts:[FetchedContact] = []
            
        for each_contact in sortedContacts
        {
            var new_month = each_contact.birthMonth
                
            if(new_month != prev_month)
            {
                GlobalVariables.monthSections.append(MonthSection(month: prev_month, cells: temp_section_contacts))
                temp_section_contacts = []
                temp_section_contacts.append(each_contact)
                prev_month = new_month
            }
            else
            {
                temp_section_contacts.append(each_contact)
            }
        }
            
        if(temp_section_contacts.count != 0)
        {
            GlobalVariables.monthSections.append(MonthSection(month: temp_section_contacts[0].birthMonth, cells: temp_section_contacts))
        }
        
        
        //Updating the table view for the first time when app is downloaded
        //When the app is downloaded for the first time it table view is updating before fetching the contact
        //So table view is updated after creating sections so all the data is collected
        //Moreover DispathQueue makes the table view to be updated in main thread
        DispatchQueue.main.async {
            self.contactsTableView.reloadData()
        }
        
    }
    
    func scheduleNotification()
    {
        //Step 1: Remove all the previous scheduled notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        //Step 2: Add new notifications
        for con in sortedContacts
        {
            let content = UNMutableNotificationContent()
            
            content.title = con.firstName+"'s birthday"
            content.sound = .default
            content.body = con.firstName+"'s birthday is today, send wishes now"
            
            var notificationTriggerDateComp = DateComponents()
            notificationTriggerDateComp.month = con.birthMonth
            notificationTriggerDateComp.day = con.birthday
            notificationTriggerDateComp.hour = 21
            notificationTriggerDateComp.minute = 14
            notificationTriggerDateComp.second = 30
            let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTriggerDateComp, repeats: false)
            
            let request = UNNotificationRequest(identifier: con.firstName, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
                if error != nil{
                 print("some thing went wrong")
                }
            })
        }
    }
}

extension UIColor
{
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension Date
{
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    var dayBefore: Date{
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var dayBeforeYesterday: Date{
        return Calendar.current.date(byAdding: .day, value: -2, to: self)!
    }
}

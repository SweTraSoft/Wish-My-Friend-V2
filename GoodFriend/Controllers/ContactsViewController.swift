//
//  ContactsViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-30.
//

import UIKit
import Contacts
import ContactsUI

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CNContactPickerDelegate, CNContactViewControllerDelegate {
    
    var contactsController = ContactsController()
    
    var contactSelected: CNContact?
    
    var contactsInitials : [String] = ["A","B","C","D","E","F","G",
                                       "H","I","J","K","L","M","N",
                                       "O","P","Q","R","S","T","U",
                                       "V","W","X","Y","Z","*"]
    var filterInitials: [String] = []
    
    var contactsSorted: [[CNContact]] = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
    
    var filterContacts: [[CNContact]] = []
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var allContactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.delegate = self
        
        sampleContacts()
        
        allContactsTableView.delegate = self
        allContactsTableView.dataSource = self

        let nib = UINib(nibName: "ContactsTableViewCell", bundle: nil)
        allContactsTableView.register(nib, forCellReuseIdentifier: "ContactsTableViewCell")
    
        configureContacts()
        
        //For the start up filter contacts should have all the contacts
        filterContacts = contactsSorted
        filterInitials = contactsInitials
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text
        {
            if string == ""
            {
                if text.count == 1
                {
                    //Resetting the content: No search string found
                    filterContacts = contactsSorted
                    filterInitials = contactsInitials
                }
                else
                {
                    //erasing text in the field
                    filterContactsData(String(text.dropLast()))
                }
            }
            else
            {
                //writing text in the field
                filterContactsData(text+string)
            }
        }
        
        //Reloading data in table view
        allContactsTableView.reloadData()
        return true
    }
    
    private func configureTapGeusture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ContactsViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap()
    {
        print("screen tapped")
        view.endEditing(true)
    }
    
    func filterContactsData(_ query: String)
    {
        //Removing all content from filterContacts
        filterContacts.removeAll()
        filterInitials.removeAll()

        for eachContactGroup in contactsSorted
        {
            var filtereachContactGroup:[CNContact] = []
            
            for eachContact in eachContactGroup
            {
                let contactName = String(eachContact.givenName)+" "+String(eachContact.middleName)+" "+String(eachContact.familyName)
                
                if contactName.lowercased().contains(query.lowercased())
                {
                    filtereachContactGroup.append(eachContact)
                }
            }
            
            if filtereachContactGroup.count != 0
            {
                filterContacts.append(filtereachContactGroup)
            }
        }
        
        for eachFilteredContactGroup in filterContacts
        {
            filterInitials.append(String(eachFilteredContactGroup[0].givenName.prefix(1).uppercased()))
        }
        
    }
    
    
    func sampleContacts()
    {
        contactsController.fetchAllContacts()
        print("Sample Contacts method "+String(ContactsController.allContacts.count))
    }
    
    
    //This method updates the contents of the dictionary contactsDictionary
    //Later this dictionary is used to show up the table view
    func configureContacts()
    {
        //Regular expression to match all alphabets
        let regex = try! NSRegularExpression(pattern: "[A-Za-z]")

        //Range definition to search for only first character
        let range = NSRange(location: 0, length: 1)
        
        
        for eachContact in ContactsController.allContacts
        {
            let firstChar = String(eachContact.givenName.prefix(1)).isEmpty ? "*" : String(eachContact.givenName.prefix(1))
            
            if regex.firstMatch(in: firstChar, options: [], range: range) != nil
            {
                contactsSorted[contactsInitials.firstIndex(of: firstChar.uppercased()) ?? 26].append(eachContact)
            }
            
        }
        
        //Sorts the array based on the given name
        for i in 0...(contactsSorted.count-1)
        {
            var temp = contactsSorted[i]
            temp = temp.sorted{ (lhs, rhs) -> Bool in
                return (lhs.givenName) < (rhs.givenName)
            }
            contactsSorted[i] = temp
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterContacts[section].count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filterContacts.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filterInitials[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = allContactsTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        cell.contactPicture.layer.cornerRadius = cell.contactPicture.frame.size.width / 2
        cell.firstName?.text =  filterContacts[indexPath.section][indexPath.row].givenName+" "+filterContacts[indexPath.section][indexPath.row].middleName+" "+filterContacts[indexPath.section][indexPath.row].familyName
    
        
        if filterContacts[indexPath.section][indexPath.row].birthday != nil
        {
            let contactBirthday:DateComponents = filterContacts[indexPath.section][indexPath.row].birthday!
            
            if contactBirthday.year == nil
            {
                let displayBirthday = String(contactBirthday.day!)+" - "+contactsController.getMonthText(month: contactBirthday.month!)
                cell.birthday.text = displayBirthday
            }
            else
            {
                let displayBirthday = String(contactBirthday.day!)+" - "+contactsController.getMonthText(month: contactBirthday.month!)+" - "+String(contactBirthday.year!)
                cell.birthday.text = displayBirthday
            }
            
        }
        else
        {
            cell.birthday.text = ""
        }
        //cell.contactPicture.image = ViewController.allContacts[indexPath.row].contactImage
        //cell.contactPicture.layer.cornerRadius = (cell.contactPicture.frame.size.width)/2
            
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       // contactSelected = contactsSorted[indexPath.section][indexPath.row]
        //performSegue(withIdentifier: "EditContactSegue", sender: contactSelected)
        let contactViewController = CNContactViewController(for: filterContacts[indexPath.section][indexPath.row])
        contactViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: contactViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
        
    }
    
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        self.navigationController!.dismiss(animated: true, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let svc = segue.destination as! WishControllerViewController
        let svc = segue.destination as! EditContactViewController
        svc.contactSelected = contactSelected
        svc.sampleDelegate = self
        
    }
}

extension ContactsViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

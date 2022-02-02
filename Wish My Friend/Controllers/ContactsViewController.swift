//
//  ContactsViewController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-30.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contactsInitials : [String] = ["A","B","C","D","E","F","G",
                                       "H","I","J","K","L","M","N",
                                       "O","P","Q","R","S","T","U",
                                       "V","W","X","Y","Z"]
    
    var names: [[String]] = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
    
    @IBOutlet var allContactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allContactsTableView.delegate = self
        allContactsTableView.dataSource = self
        
        let nib = UINib(nibName: "ContactsTableViewCell", bundle: nil)
        allContactsTableView.register(nib, forCellReuseIdentifier: "ContactsTableViewCell")
        
        configureContacts()
    }
    
    //This method updates the contents of the dictionary contactsDictionary
    //Later this dictionary is used to show up the table view
    func configureContacts()
    {
        
        print("important logs")
        print(contactsInitials.count)
        print("Sarath")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.allContacts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allContactsTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        cell.firstName?.text = ViewController.allContacts[indexPath.row].firstName+" "+ViewController.allContacts[indexPath.row].lastName
        cell.contactPicture.image = ViewController.allContacts[indexPath.row].contactImage
        cell.contactPicture.layer.cornerRadius = (cell.contactPicture.frame.size.width)/2
            
        
        return cell;
    }

}

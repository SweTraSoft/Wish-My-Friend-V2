//
//  ContactsController.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-02-03.
//
import Contacts
import Foundation
import ContactsUI

class ContactsController
{
    static var allContacts = [CNContact]()
    let contactStore = CNContactStore()
    
    //Mentioning all the content what we need to fetch from CNContactStore
    let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactBirthdayKey, CNContactImageDataKey, CNContactImageDataAvailableKey, CNContactViewController.descriptorForRequiredKeys()] as [Any]
    
    var allContainers: [CNContainer] = []
    
    //Function to fetch all contacts and update to static variable allContacts
    func fetchAllContacts()
    {
        //Remove all the content in the allContacts static variable
        ContactsController.allContacts.removeAll()
        
        do
        {
            allContainers = try contactStore.containers(matching: nil)
        }
        catch
        {
            print("Error fetching containers")
        }
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            do
            {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                ContactsController.allContacts.append(contentsOf: containerResults)
            }
            catch
            {
                print("Error fetching containers")
            }
        }
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
}

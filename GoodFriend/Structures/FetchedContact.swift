//
//  FetchedContacts.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2022-01-30.
//

import Foundation
import UIKit
import Contacts

struct FetchedContact
{
    var firstName: String
    var lastName: String
    var telephone: String
    var birthday: Int
    var birthMonth: Int
    var birthYear: Int
    var contactImage: UIImage
    var birthdayDate: Date
    var ramainingDays: Int
    var contact: CNContact
    var weekDay: String //Weekday for the next upcoming birthday
    var upcomingBirthdayNextYear: Bool //If upcoming birthday is in next year
}

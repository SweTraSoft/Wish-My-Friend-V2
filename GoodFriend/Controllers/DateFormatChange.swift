//
//  DateFormatChange.swift
//  GoodFriend
//
//  Created by Sarath Chandra Damineni on 2022-05-07.
//

import Foundation

public class DateFormatChange
{
    func dateSuperscript(date:Int) -> String
    {
        switch date {
        case 1:
            return "1st"
        case 2:
            return "2nd"
        case 3:
            return "3rd"
        case 4:
            return "4th"
        case 5:
            return "5th"
        case 6:
            return "6th"
        case 7:
            return "7th"
        case 8:
            return "8th"
        case 9:
            return "9th"
        case 10:
            return "10th"
        case 11:
            return "11th"
        case 12:
            return "12th"
        case 13:
            return "13th"
        case 14:
            return "14th"
        case 15:
            return "15th"
        case 16:
            return "16th"
        case 17:
            return "17th"
        case 18:
            return "18th"
        case 19:
            return "19th"
        case 20:
            return "20th"
        case 21:
            return "21st"
        case 22:
            return "22nd"
        case 23:
            return "23rd"
        case 24:
            return "24th"
        case 25:
            return "25th"
        case 26:
            return "26th"
        case 27:
            return "27th"
        case 28:
            return "28th"
        case 29:
            return "29th"
        case 30:
            return "30th"
        case 31:
            return "31st"
        default:
            return "Default from date super script"
        }
    }
        func shortWeekday(weekDay: String) -> String
        {
            switch weekDay{
            case "Monday":
                return "Mon"
            case "Tuesday":
                return "Tue"
            case "Wednesday":
                return "Wed"
            case "Thursday":
                return "Thurs"
            case "Friday":
                return "Fri"
            case "Saturday":
                return "Sat"
            case "Sunday":
                return "Sun"
            default:
                return "Default weekday shorthand"
            }
        }
    
    func monthShortHand(month: Int) -> String
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

    
}

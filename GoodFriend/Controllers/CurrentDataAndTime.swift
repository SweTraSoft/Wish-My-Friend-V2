//
//  CurrentDataAndTime.swift
//  GoodFriend
//
//  Created by Sarath Chandra Damineni on 2022-05-23.
//

import Foundation

public class CurrentDataAndTime
{
    //global variables for the date
    var cur_glb_date: Date? = nil
    var cur_glb_day: Int = 0
    var cur_glb_month: Int = 0
    var cur_glb_year: Int = 0
    
    init()
    {
        //creating the global current date and month variables
        cur_glb_date = Date()
        cur_glb_day = (cur_glb_date?.get(.day))!
        cur_glb_month = cur_glb_date!.get(.month)
        cur_glb_year = (cur_glb_date?.get(.year))!
    }
    
}



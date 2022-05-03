//
//  WesternZodiacLoader.swift
//  GoodFriend
//
//  Created by Sarath Chandra Damineni on 2022-05-03.
//

import Foundation

public class WesternZodiacLoader
{
    @Published var westernZodiac = [WesternZodiacStructure]()
    
    init() {
        load()
    }
    
    func load()
    {
        if let file_location = Bundle.main.url(forResource: "WesternZodiacInfo", withExtension: "json")
        {
            do{
                let data = try Data(contentsOf: file_location)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([WesternZodiacStructure].self, from: data)
                
                self.westernZodiac = dataFromJson
            }
            catch{
                print("error reading JSON")
            }
        }
        else
        {
            print("JSON file not opened")
        }
    }
    
}

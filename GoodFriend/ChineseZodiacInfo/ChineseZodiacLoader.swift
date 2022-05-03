//
//  ChineseZodiacLoader.swift
//  Wish My Friend
//
//  Created by Sarath Chandra Damineni on 2021-12-29.
//

import Foundation

public class ChineseZodiacLoader
{
    @Published var chineseZodiac = [ChineseZodiacStructure]()
    
    init() {
        load()
    }
    
    func load()
    {
        if let file_location = Bundle.main.url(forResource: "ChineseZodiacInfo", withExtension: "json")
        {
            do{
                let data = try Data(contentsOf: file_location)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([ChineseZodiacStructure].self, from: data)
                
                self.chineseZodiac = dataFromJson
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

//
//  EnglishZodiacLoader.swift
//  GoodFriend
//
//  Created by Sarath Chandra Damineni on 2022-05-10.
//

import Foundation

public class EnglishZodiacLoader
{
    @Published var englishZodiac = [EnglishZodiacStructure]()
    
    init() {
        load()
    }
    
    func load()
    {
        if let file_location = Bundle.main.url(forResource: "EnglishZodiacInfo", withExtension: "json")
        {
            do{
                print("Log:: EnglishZodiacLoader: ",file_location)
                let data = try Data(contentsOf: file_location)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([EnglishZodiacStructure].self, from: data)
                
                self.englishZodiac = dataFromJson
            }
            catch{
                print("Log:: EnglishZodiacLoader: error reading JSON")
            }
        }
        else
        {
            print("Log:: EnglishZodiacLoader: JSON file not opened")
        }
    }
    
}

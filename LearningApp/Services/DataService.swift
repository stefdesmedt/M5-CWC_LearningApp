//
//  DataService.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import Foundation

class DataService {
    
    
    
    static func getLocalData() -> [Module] {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        guard jsonUrl != nil else {
            return [Module]()
        }
        
        do {
            
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let moduleData = try jsonDecoder.decode([Module].self, from: jsonData)
                
                let modules = moduleData
                
                return modules
                
            } catch {
                print(error)
            }
        
        } catch {
            
            print(error)
        
        }
        
        
        return [Module]()
        
    }
    
    
    static func parseStyleData() -> Data? {
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        guard styleUrl != nil else {
            
            return nil
    
        }
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
    
            return styleData
            
        } catch {
            
            print(error)
        }
        
        return nil
        
    }
}

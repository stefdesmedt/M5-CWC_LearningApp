//
//  ContentModel.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    //List of modules
    @Published var modules = [Module]()
    
    //Track the state of where the user is
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData:Data?
    
    init() {
        
        self.modules = DataService.getLocalData()
        self.styleData = DataService.parseStyleData()
    
    }
    
    //MARK: Module navigation methods
    
    func beginModule (_ moduleId:Int) {
        
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
        
    }
    
}

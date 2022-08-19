//
//  ContentModel.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData:Data?
    
    init() {
        
        self.modules = DataService.getLocalData()
        
        self.styleData = DataService.parseStyleData()
    }
    
}

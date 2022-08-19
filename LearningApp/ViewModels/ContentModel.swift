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
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
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
    
    func beginLesson (_ lessonIndex: Int) {
        
        //Check index is in range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
          currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        
        //Set current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        
    }
    
    func hasNextLesson() -> Bool {
        
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    
    }
    
    func advanceToNextLesson () {
        
        //Advance less
        currentLessonIndex += 1
        
        //Check in range
        if currentLessonIndex < currentModule!.content.lessons.count {
            //Set lesson prop
            currentLesson = currentModule!.content.lessons[currentLessonIndex]

        } else {
           
            //Reset the lesson state
            currentLesson = nil
            currentLessonIndex = 0
            
        }
        
     
    }
    
}

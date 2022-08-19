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
    
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    @Published var codeText = NSAttributedString()
    var styleData:Data?
    
    //Current selected content and quiz
    @Published var currentContent:Int?
    @Published var currentTestSelection:Int?
    
    
    
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
        
        //Set the lesson description
        codeText = addStyling(currentLesson!.explanation)
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
            codeText = addStyling(currentLesson!.explanation)

        } else {
           
            //Reset the lesson state
            currentLesson = nil
            currentLessonIndex = 0
            
        }
    }
    
    //MARK: Test naviation
    
    func beginTest(_ moduleId:Int ) {
        
        //Set current module
        beginModule(moduleId)
        
        //Set current question
        currentQuestionIndex = 0
        //If there are questions set question to first one
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            //Set the question content
            codeText = addStyling(currentQuestion!.content)
            
        }
    }
    
    func advanceToNextQuestion() {
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < currentModule!.test.questions.count {
            
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(currentQuestion!.content)
            
        } else {
            
            currentQuestionIndex = 0
            currentQuestion = nil
            
        }
        
    }
    
    //MARK: Code Styling
    
    private func addStyling(_ htmlString:String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        //Add styling data
        if styleData != nil {
            data.append(styleData!)
        }
        
        //Add HTML data
        data.append(Data(htmlString.utf8))
        
        //Convery to an attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
                resultString = attributedString
        }
        
        return resultString
    }
    
}

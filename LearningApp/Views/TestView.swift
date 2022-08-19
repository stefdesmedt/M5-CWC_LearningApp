//
//  TestView.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack{
                //Question number
                Text("Question \(model.currentQuestionIndex+1) of \(model.currentModule?.test.questions.count ?? 0)")
                //Question
                CodeTextView()
                    .padding(.horizontal)
                //Answers
                
                //Button to submit
                
            }
            .foregroundColor(.black)
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        } else {
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

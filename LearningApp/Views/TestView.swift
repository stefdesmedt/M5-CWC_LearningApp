//
//  TestView.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submittedStatus = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading){
                //Question number
                Text("Question \(model.currentQuestionIndex+1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                //Question
                CodeTextView()
                    .padding(.horizontal)
                //Answers
                ScrollView {
                    VStack {
                        
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self)
                            { index in
                                Button(
                                    action: {
                                        //Track Selected Index
                                        selectedAnswerIndex = index
                                    },
                                    label: {
                                        ZStack {
                                            if submittedStatus == false {
                                                //No answer is selected yet show white or gray
                                                RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                                    .frame(height:48)
                                            } else {
                                                //Answer is selected
                                                if index == selectedAnswerIndex &&
                                                    index == model.currentQuestion!.correctIndex {
                                                    //Correct answer was selected so color it green
                                                    RectangleCard(color: Color.green)
                                                        .frame(height:48)
                                                } else if index == selectedAnswerIndex &&
                                                            index != model.currentQuestion!.correctIndex {
                                                    //If the wrong answer is selected highlight the choice red
                                                    RectangleCard(color: Color.red)
                                                        .frame(height:48)
                                                    
                                                } else if index == model.currentQuestion!.correctIndex {
                                                    //Color the right answer in green to show the mistake
                                                    RectangleCard(color: Color.green)
                                                        .frame(height:48)
                                                } else {
                                                    //All the non involved buttons should be styled white
                                                    RectangleCard(color: Color.white)
                                                        .frame(height:48)
                                                }
                                                
                                            }
                                            
                                            Text(model.currentQuestion!.answers[index])
                                                .foregroundColor(.black)
                                            
                                        }.padding(.horizontal,30)
                                    }).disabled(submittedStatus)
                        }
                    }
                }
                //Button to submit
                Button(
                    action: {
                        
                        submittedStatus = true
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                                              numCorrect += 1
                        }
                        
                    },
                    label: {
                        ZStack{
                            RectangleCard(color: Color.green)
                                .frame(height: 60)
                            Text("Submit")
                                .foregroundColor(.white)
                                .bold()
                        }.padding(.horizontal, 30)
                    }).disabled(selectedAnswerIndex == nil)
               
            }
            .accentColor(.black)
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

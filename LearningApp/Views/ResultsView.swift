//
//  ResultsView.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var model: ContentModel
    
    var numCorrect:Int
    
    var resultFeedback: String {
        
        guard model.currentModule != nil else {
            return ""
        }

        let percentage = (Double(numCorrect) / Double(model.currentModule!.test.questions.count)) * 100
        
            if percentage > 80.00 {
                return "Great Job"
            } else if percentage > 50.00 {
                return "Good effort!"
            } else {
                return "Keep Learning"
            }
        }
    
    
    var body: some View {
       
        VStack {
            Spacer()
            Text(resultFeedback)
                .font(.largeTitle)
            Text("You scored \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            Spacer()
            Button(
                action: {
                    model.currentTestSelection = nil
            }, label: {
                
                ZStack{
                    RectangleCard(color: Color.green)
                        .frame(height: 48)
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }.padding(.horizontal,50)
            })
            Spacer()
        }
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(numCorrect: 10)
    }
}

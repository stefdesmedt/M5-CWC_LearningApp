//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI
//Add this to be able to include videos
import AVKit

struct ContentDetailView: View {
   
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            //Only show video if URL works
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            CodeTextView()
            
            if model.hasNextLesson() {
                Button(
                    action: {
                        model.advanceToNextLesson()
                        },
                    label: {
                       
                        ZStack {
                            
                            RectangleCard(color: Color.green)
                                .frame(height: 48)
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        })
               
            } else {
                Button(
                    action: {
                        model.currentContent = nil
                        },
                    label: {
                       
                        ZStack {
                            
                            RectangleCard(color: Color.green)
                                .frame(height: 48)
                            Text("Complete")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        })
            }
            
            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
        
        
    
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

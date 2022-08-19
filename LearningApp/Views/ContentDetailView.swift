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
            
            if model.hasNextLesson() {
                Button(
                    action: {
                        model.advanceToNextLesson()
                        },
                    label: {
                       
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(Color.green)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 5)
                                .frame(height: 48)
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        })
               
            }
            
            
        }
        .padding()
        
        
    
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}

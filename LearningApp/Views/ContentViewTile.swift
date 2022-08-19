//
//  ContentViewTile.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI



struct ContentViewTile: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5)
                .frame(height: 66)
                
            HStack(alignment: .center, spacing: 20) {
                
                Text(String(index + 1))
                    .bold()
                    .padding(.leading,10)
                
                VStack(alignment: .leading){
                    
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
                Spacer()
            }
        }.padding(.horizontal)
            .padding(.vertical,5)
        
    }
}

struct ContentViewTile_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTile(index: 0)
    }
}

//
//  ContentView.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
       
        ScrollView {
            
            LazyVStack {
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(
                            destination: {
                                ContentDetailView()
                                    .onAppear(perform: {
                                        model.beginLesson(index)
                                    })
                                },
                            label: {  ContentViewTile(index: index)  })
                        
                        
                        
                        
                    }
                    
                }
               
                
                
            }
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
            .padding()
            .accentColor(.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

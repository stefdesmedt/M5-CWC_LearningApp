//
//  ContentView.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading){
                Text("What do you want to do today")
                    .padding(.leading, 20)
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules){ module in
                            
                            VStack(spacing: 30) {
                                
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        })
                                    ,
                                    label: {
                                        HomeViewTile(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time)
                                    })
                                
                                
                                HomeViewTile(image: module.test.image, title: " \(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) questions", time: module.test.time)
                            }
                            
                        }
                    }.padding(30)
                        .foregroundColor(.black)
                }
            }
            
            .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}

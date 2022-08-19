//
//  HomeViewTile.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

struct HomeViewTile: View {

    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
        
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                    .padding(10)
                Spacer()
                VStack (alignment: .leading, spacing: 10) {
                    Text(title)
                        .bold()
                        .font(Font.system(size: 18))
                    Text(description)
                        .padding(.bottom, 20)
                        .font(Font.system(size: 14))
                        .multilineTextAlignment(.leading)
                    HStack{
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(.caption)
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(.caption)
                    }
                   
                }.padding(.trailing)
                
            }

        }
   
    }
}

struct HomeViewTile_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTile(image: "swift", title: "Learn Swift", description: "describe", count: "10 lessons", time: "2 hours")
    }
}

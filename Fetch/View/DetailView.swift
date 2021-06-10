//
//  DetailView.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    var event: Event 
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 8, content: {
                Text(event.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Divider()
                
                WebImage(url: URL(string: event.imageURL)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 250)
                    .cornerRadius(8)
                    .padding(.top, 10)
                
                HStack(spacing: 8) {
                    VStack(spacing: 8) {
                        Text(event.dateTime)
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Text(event.location)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    //Upon Button Press, Toggle/Add Event.ID to a persistent data store
                    Button(action: {}, label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .padding(15)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.gray.opacity(0.75))
                            .cornerRadius(45)
                    })
                }
                .padding()
            })
            .padding(.horizontal)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(event: Event(id: 999, title: "Title", dateTime: "Date/Time", location: "LocationTxt", imageURL: "https://seatgeek.com/images/performers-landscape/new-york-city-fc-42b38e/297993/huge.jpg"))
    }
}


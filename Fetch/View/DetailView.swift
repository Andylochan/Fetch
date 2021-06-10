//
//  DetailView.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @EnvironmentObject var homeData: HomeViewModel
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
                    VStack(alignment: .leading, spacing: 8) {
                        Text(homeData.formatDate(date: event.dateTime))
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(event.location)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    //Upon button press, toggle/add event.ID to favorites
                    Button(action: {
                        if homeData.contains(event) {
                            homeData.remove(event)
                        } else {
                            homeData.add(event)
                        }
                    }, label: {
                        Image(systemName: homeData.contains(event) ? "heart.fill" : "heart")
                            .resizable()
                            .padding(15)
                            .frame(width: 75, height: 70)
                            .foregroundColor(homeData.contains(event) ? .red : Color.gray.opacity(0.5))
                    })
                }
                .padding()
            })
            .padding(.horizontal)
        }
    }
}

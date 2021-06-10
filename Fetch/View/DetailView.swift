//
//  DetailView.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject var favorites = Favorites()
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
                    
                    //Upon button press, toggle/add event.ID to favorites
                    Button(action: {
                        if favorites.contains(event) {
                            favorites.remove(event)
                        } else {
                            favorites.add(event)
                        }
                    }, label: {
                        Image(systemName: favorites.contains(event) ? "heart.fill" : "heart")
                            .resizable()
                            .padding(15)
                            .frame(width: 75, height: 70)
                            .foregroundColor(favorites.contains(event) ? .red : Color.gray.opacity(0.5))
                    })
                }
                .padding()
            })
            .padding(.horizontal)
        }
    }
}

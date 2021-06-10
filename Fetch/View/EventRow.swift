//
//  EventRow.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventRow: View {
    @EnvironmentObject var homeData: HomeViewModel
    var event: Event

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            WebImage(url: extractImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(event.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack(spacing: 8, content: {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(event.location)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(homeData.formatDate(date: event.dateTime))
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        NavigationLink(
                            destination: DetailView(event: event),
                            label: {
                                Text("Details")
                            })
                    }
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: homeData.contains(event) ? "heart.fill" : "heart")
                        .resizable()
                        .padding(10)
                        .frame(width: 40, height: 40)
                        .foregroundColor(homeData.contains(event) ? .red : Color.white.opacity(0.0))
                        .background(Color.white)
                        .cornerRadius(45)
                })
            }
        }
        .padding(.horizontal)
    }

    private func extractImage() -> URL {
        return URL(string: event.imageURL)!
    }
}

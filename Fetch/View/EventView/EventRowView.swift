//
//  EventRowView.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventRowView: View {

    var event: Event

    var body: some View {

        HStack(alignment: .top, spacing: 15) {
            WebImage(url: extractImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(event.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(event.dateTime)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            })
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }

    func extractImage() -> URL {
        return URL(string: event.imageURL)!
    }
}

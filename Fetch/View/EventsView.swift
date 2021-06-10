//
//  EventsView.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI

struct EventsView: View {
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    //Search Bar
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search Events", text: $homeData.searchQuery)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                }
                .padding()
                
                if let events = homeData.fetchedEvents {
                    if events.isEmpty {
                        Text("No Results Found")
                            .padding(.top, 20)
                    }
                    else {
                        //Display Results
                        ForEach(events) { data in
                            EventRow(event: data)
                        }
                    }
                }
                else {
                    if homeData.searchQuery != "" {
                        //Loading View
                        ProgressView()
                            .padding(.top, 20)
                    }
                }
            })
            .navigationTitle("Events")
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

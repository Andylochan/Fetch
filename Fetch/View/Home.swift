//
//  Home.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    @StateObject var favorites = Favorites()
    
    var body: some View {
        EventsView()
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Events")
            }
            //Setting environmentObject so that we can access data in EventsView
            .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

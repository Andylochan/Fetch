//
//  Home.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        EventsView()
            .environmentObject(homeData)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  HomeViewModel.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchQuery = ""
    
    //Combine framework search bar
    //Cancel search publisher when needed
    var searchCancellable: AnyCancellable? = nil
    
    //Fetched Data
    @Published var fetchedEvents: [Event]? = nil
    
    init() {
        searchCancellable = $searchQuery
            .removeDuplicates()
            //Wait 0.6 sec after user is done typing, then fetch
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str == "" {
                    //Reset Data
                    self.fetchedEvents = nil
                }
                else {
                    self.searchEvents()
                }
            })
    }

    func searchEvents() {
        DataHandler.shared.fetchEvents(with: searchQuery) { [unowned self] (result, events) in
            if let res = result {
                self.fetchedEvents = events
                print(res ? "Fetch Success" : "Fetch Error")
            }
        }
    }
    
}

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
    @Published var fetchedEvents: [Event]? = nil

    //Cancel search publisher when needed
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        //Wait 0.6 sec after user is done typing, then fetch
        searchCancellable = $searchQuery
            .removeDuplicates()
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

    private func searchEvents() {
        let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "+")
        
        DataHandler.shared.fetchEvents(with: originalQuery) { [unowned self] (result, events) in
            if let res = result {
                self.fetchedEvents = events
                print(res ? "Fetch Success" : "Fetch Error")
            }
        }
    }
}

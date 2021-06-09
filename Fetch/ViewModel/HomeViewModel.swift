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
    
    //Combine Framework Search Bar
    
    //Cancel search publisher when needed
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchQuery
            .removeDuplicates()
            //Wait 0.6 sec after user is done typing, then fetch
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str == "" {
                    //Reset Data
                }
                else {
                    //Search Data
                    print(str)
                }
            })
    }

}

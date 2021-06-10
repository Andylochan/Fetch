//
//  Favorites.swift
//  Fetch
//
//  Created by Andy Lochan on 6/10/21.
//

import SwiftUI

class Favorites: ObservableObject {
    
    private var events: Set<Int>
    let defaults = UserDefaults.standard
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let eventData = try? decoder.decode(Set<Int>.self, from: data)
            self.events = eventData ?? []
        } else {
            self.events = []
        }
    }
    
    func getEventIds() -> Set<Int> {
        return self.events
    }
    
    func isEmpty() -> Bool {
        events.count < 1
    }
    
    func contains(_ event: Event) -> Bool {
        events.contains(event.id)
    }
    
    func add(_ event: Event) {
        objectWillChange.send()
        events.insert(event.id)
        save()
    }
    
    func remove(_ event: Event) {
        objectWillChange.send()
        events.remove(event.id)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(events) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}

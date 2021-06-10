//
//  HVM + DateFormat.swift
//  Fetch
//
//  Created by Andy Lochan on 6/10/21.
//

import SwiftUI

extension HomeViewModel {
    
    func formatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "zzz")
        let convertedDate = dateFormatter.date(from: date)

        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }

        //DAY MONTH DATE, YEAR HOUR:MIN AM/PM
        dateFormatter.dateFormat = "EEEE MMM d, yyyy h:mm a"
        dateFormatter.timeZone = NSTimeZone(name: "EST") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)

        return timeStamp
    }
}

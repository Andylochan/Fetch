//
//  JUNK.swift
//  Fetch
//
//  Created by Andy Lochan on 6/9/21.
//

//CLEANUP CODE NOTES ON BOTTOM



//    func getSingleEvent(closure: @escaping (Bool?, [Event]?) -> Void) {
//
//        let url = "https://api.seatgeek.com/2/events/801255?client_id=MjIxNzM2OTR8MTYyMzI2NzM3Ny4xMDcyODY1&client_secret=99b0cc74a6fe2db72246ad86a9cc19044c384098a1d240ec971c6dc8d245fb45"
//        var events = [Event]()
//
//        Alamofire.request(url, method: .get).responseJSON { response in
//
//            if response.error != nil {
//                closure(nil, nil)
//                return
//            }
//
//            if let data = response.data, let json = try? JSON(data: data) {
//                let title = json.dictionaryObject?["title"] as? String ?? ""
//                let eventToAppend = Event(id: 0, title: title)
//                events.append(eventToAppend)
//
//                closure(true, events)
//            }
//        }
//    }

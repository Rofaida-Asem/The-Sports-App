//
//  Events.swift
//  The Sports App
//
//  Created by Om Malikah  on 12/11/1443 AH.
//

import Foundation

struct AllEvents: Decodable{
    let events: [Event]
}

struct Event: Decodable{
    
    let strEvent: String
    let strTime: String
    let dateEvent: String
    let strThumb: String?
    let strHomeTeam: String
    let strAwayTeam: String
    let intHomeScore: String
    let intAwayScore: String
}

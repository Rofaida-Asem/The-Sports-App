//
//  Leagues.swift
//  The Sports App
//
//  Created by Om Malikah  on 08/11/1443 AH.
//

import Foundation

struct AllLeagues: Decodable {
    let countries: [League]
}

struct League: Decodable {
    
    let idLeague: String
    let strSport: String?
    let strLeague: String
    let strCountry: String?
    let strYoutube: String?
    let strBadge: String?
    
}

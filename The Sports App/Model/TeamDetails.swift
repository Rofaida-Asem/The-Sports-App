//
//  TeamDetails.swift
//  The Sports App
//
//  Created by Om Malikah  on 12/11/1443 AH.
//

import Foundation
struct Teams : Decodable {
    let teams: [Team]
}

struct Team : Decodable {
    let idTeam:String
    let strTeam:String?
    let strSport: String?
    let strLeague:String?
    let strCountry: String?
    let intFormedYear:String?
    let strWebsite:String?
    let strFacebook:String?
    let strTwitter:String?
    let strInstagram:String?
    let strDescriptionEN:String?
    let strYoutube:String?
    let strTeamBadge:String?
    let strTeamFanart1:String?
    let strStadium:String?
    let strStadiumThumb:String?
  
}

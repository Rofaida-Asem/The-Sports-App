//
//  AllSports.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import Foundation

struct AllSport : Decodable {
    let sports : [Sport]
}

struct Sport : Decodable {
    
    var idSport : String
    var strSport : String
    var strFormat : String?
    var strSportThumb : String?
    var strSportIconGreen : String?
    var strSportDescription : String?
    
}

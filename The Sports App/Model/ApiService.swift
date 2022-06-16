//
//  ApiService.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import Foundation

class ApiService {
    
    static let shared = ApiService()
    
    private init() {
        
    }
    
    func fetchSports(completionHandler: @escaping (AllSport?) -> Void) {
        guard let url = URL(string:"https://www.thesportsdb.com/api/v1/json/2/all_sports.php") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            do {
                
                let result = try JSONDecoder().decode(AllSport.self, from: data)
                completionHandler(result)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
    func fetch(sport: String, completionHandler: @escaping (AllLeagues?) -> Void) {
        
        let urlStr = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(sport)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlStr) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            print(data)
            do {
                let json = try JSONDecoder().decode(AllLeagues.self, from: data)
                completionHandler(json)
            } catch let errorr {
                debugPrint(errorr.localizedDescription)
            }
        }
        task.resume()
    }
    
    func fetchEvents(byLeague: String, completionHandler: @escaping (AllEvents?) -> Void) {
        guard let url = URL(string:"https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4617") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            do {
                
                let result = try JSONDecoder().decode(AllEvents.self, from: data)
                completionHandler(result)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
    func fetchTeamDetails(byLeague: String, completionHandler: @escaping (Teams?) -> Void) {
        guard let url = URL(string:"https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            do {
                
                let result = try JSONDecoder().decode(Teams.self, from: data)
                completionHandler(result)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
    
}

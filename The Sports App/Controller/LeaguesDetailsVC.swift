//
//  LeaguesDetailsVC.swift
//  The Sports App
//
//  Created by Om Malikah  on 08/11/1443 AH.
//

import UIKit
import Kingfisher

class LeaguesDetailsVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var upcomingEventsCollectionView: UICollectionView!
    @IBOutlet weak var latestResultscollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    var event = [Event]()
    var teamDetails = [Team]()
    var league : League!
    var currentCell : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingEventsCollectionView.delegate = self
        upcomingEventsCollectionView.dataSource = self
        latestResultscollectionView.delegate = self
        latestResultscollectionView.dataSource = self
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        getEvent(league: league)
        getTeam(league: league)
    }
    
    func getEvent (league: League) {
        ApiService.shared.fetchEvents(byLeague: league.idLeague) { result in
            DispatchQueue.main.async {
                self.updateUI(result: result)
            }
        }
    }
    
    func updateUI (result : AllEvents?) {
        event = result?.events ?? []
        self.upcomingEventsCollectionView.reloadData()
        self.latestResultscollectionView.reloadData()
        self.teamsCollectionView.reloadData()
    }
    
    func getTeam (league: League) {
        ApiService.shared.fetchTeamDetails(byLeague: league.strLeague) { result in
            DispatchQueue.main.async {
                self.updateTeamsUI(result: result)
            }
        }
    }
    
    func updateTeamsUI (result : Teams?) {
        teamDetails = result?.teams ?? []
        self.teamsCollectionView.reloadData()
    }
    @IBAction func teamDeatailsButton(_ sender: UIButton) {
        let TeamDetailsVC = storyboard?.instantiateViewController(withIdentifier: "TeamDetailsVC") as! TeamDetailsVC
        TeamDetailsVC.teamDeatails = teamDetails[currentCell-1]
        self.navigationController?.pushViewController(TeamDetailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == upcomingEventsCollectionView {
            return event.count
        }else if collectionView == latestResultscollectionView {
            return event.count
        }else{
            return teamDetails.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upcomingEventsCollectionView {
            
            guard let cell1 = upcomingEventsCollectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionViewCell" , for: indexPath) as? UpcomingCollectionViewCell else { return UICollectionViewCell() }
            
            cell1.upcomingImageView.kf.setImage(with: URL(string: event[indexPath.row].strThumb ?? ""))
            cell1.eventNameLabel.text = event[indexPath.row].strEvent
            cell1.eventDateLabel.text = event[indexPath.row].dateEvent
            cell1.eventTimeLabel.text = event[indexPath.row].strTime
            
            return cell1
            
        }else if collectionView == latestResultscollectionView {
            guard let cell2 = latestResultscollectionView.dequeueReusableCell(withReuseIdentifier: "ResultsCollectionViewCell" , for: indexPath) as? ResultsCollectionViewCell else { return UICollectionViewCell() }
            
            cell2.fristTeamNameLabel.text = event[indexPath.row].strHomeTeam
            cell2.secondTeamNameLabel.text = event[indexPath.row].strAwayTeam
            cell2.firstScoreLabel.text = event[indexPath.row].intHomeScore
            cell2.secondScoreLabel.text = event[indexPath.row].intAwayScore
            cell2.dateLabel.text = event[indexPath.row].dateEvent
            cell2.timeLabel.text = event[indexPath.row].strTime
            
            return cell2
        }else{
            guard let cell3 = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell" , for: indexPath) as? TeamsCollectionViewCell else { return UICollectionViewCell() }
            cell3.teamImageView.layer.cornerRadius = 64.0
            cell3.teamImageView.kf.setImage(with: URL(string: teamDetails[indexPath.row].strTeamBadge ?? ""))
            
            let TeamDetailsVC = storyboard?.instantiateViewController(withIdentifier: "TeamDetailsVC") as! TeamDetailsVC
          //  TeamDetailsVC.teamDeatails = teamDetails[indexPath.row]
           // self.navigationController?.pushViewController(TeamDetailsVC, animated: true)
            currentCell = indexPath.row
            
            return cell3
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: upcomingEventsCollectionView.frame.width/1, height: upcomingEventsCollectionView.frame.height/1 )
        
    }
    
    
}

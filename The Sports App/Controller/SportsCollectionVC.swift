//
//  SportsCollectionVC.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

class SportsCollectionVC : UICollectionViewController , UICollectionViewDelegateFlowLayout  {
    
    var sports = [Sport]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getSports()
        
    }
    
    func registerCell(){
        let nibCell = UINib(nibName: "SportCollectionViewCell", bundle: nil)
        self.collectionView!.register(nibCell, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func getSports () {
        ApiService.shared.fetchSports { result in
            DispatchQueue.main.async {
                self.updateUI(result: result)
            }
        }
    }
    
    func updateUI (result : AllSport?) {
        sports = result?.sports ?? []
        self.collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sports.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SportCollectionViewCell else { return UICollectionViewCell() }
        
        cell.sportNameLabel!.text = sports[indexPath.row].strSport
        cell.sportImageView.kf.setImage(with: URL(string: sports[indexPath.row].strSportThumb!) , placeholder : UIImage(named: "sport-equipment-icon-set_78072-479"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/5 )
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let leaguesTVC = storyboard?.instantiateViewController(withIdentifier: "LeaguesTVC") as! LeaguesTVC
        leaguesTVC.sport = sports[indexPath.row]
        self.navigationController?.pushViewController(leaguesTVC, animated: true)
        
    }
    
}

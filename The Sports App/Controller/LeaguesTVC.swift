//
//  LeaguesTVC.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import UIKit
import Kingfisher

class LeaguesTVC: UITableViewController {
    
    var league = [League]()
    var sport: Sport!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getSportLeagues(sport: sport)
        
    }
    
    func registerCell(){
        let nibCell = UINib(nibName: "LeaguesTableViewCell", bundle: nil)
        self.tableView.register(nibCell, forCellReuseIdentifier: "Cell")
    }
    
    func getSportLeagues (sport: Sport) {
        ApiService.shared.fetch(sport: sport.strSport) { result in
            DispatchQueue.main.async {
                self.updateUI(result: result)
            }
        }
    }
    
    func updateUI (result : AllLeagues?) {
        league = result?.countries ?? []
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return league.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LeaguesTableViewCell else {return UITableViewCell() }
     
         cell.leagueNameLable.text = league[indexPath.row].strLeague
         cell.leaguesImageView.kf.setImage(with: URL(string: league[indexPath.row].strBadge ?? ""))
        
         
     return cell
     }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let LeaguesDetailsVC = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        LeaguesDetailsVC.league = league[indexPath.row]
        self.navigationController?.pushViewController(LeaguesDetailsVC, animated: true)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

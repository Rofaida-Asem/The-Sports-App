//
//  FavoriteTVC.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import UIKit

class FavoriteTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    func registerCell(){
        let nibCell = UINib(nibName: "LeaguesTableViewCell", bundle: nil)
        self.tableView.register(nibCell, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LeaguesTableViewCell else {return UITableViewCell() }
     
     
     
     return cell
     }
     
}

//
//  LeaguesTableViewCell.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {
    @IBOutlet weak var leaguesImageView: UIImageView!
    @IBOutlet weak var leagueNameLable: UILabel!
    
    var league : League!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRounded()
    }
    
    func makeRounded () {
        leaguesImageView?.layer.borderWidth = 1
        leaguesImageView?.layer.cornerRadius = 16.0
        leaguesImageView?.clipsToBounds = true
    }
    
    @IBAction func youtubeButton(_ sender: UIButton) {
        
        let urlstr = league?.strYoutube ?? "https://www.youtube.com/channel/UCJmCVoUfCBQb9lcfXIS8nXQ"
        guard let url = URL(string: urlstr) else {return}
        UIApplication.shared.open(url)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//
//  SportCollectionViewCell.swift
//  The Sports App
//
//  Created by Om Malikah  on 07/11/1443 AH.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sportImageView: UIImageView!
    @IBOutlet weak var sportNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func toLeaguesVCButton(_ sender: UIButton) {
    }
    
}

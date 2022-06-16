//
//  TeamDetailsVC.swift
//  The Sports App
//
//  Created by Om Malikah  on 12/11/1443 AH.
//

import UIKit

class TeamDetailsVC: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var websiteLinkTextView: UITextView!
    @IBOutlet weak var facebookLinkTextView: UITextView!
    @IBOutlet weak var instagramLinkTextView: UITextView!
    @IBOutlet weak var twitterLinkTextView: UITextView!
    
    var teamDeatails : Team!
    
    @IBOutlet weak var yearLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamImage.layer.cornerRadius = 50.0
        link()
        setTeamDetails()
    }
    
    func setTeamDetails(){
        teamImage.kf.setImage(with: URL(string: teamDeatails.strTeamBadge ?? ""))
        backgroundImageView.kf.setImage(with: URL(string: teamDeatails.strStadiumThumb ?? "صور-ملاعب23"))
        teamNameLabel.text = teamDeatails.strTeam
        leagueNameLabel.text = teamDeatails.strLeague
        countryNameLabel.text = teamDeatails.strCountry
        stadiumLabel.text = teamDeatails.strStadium
        descriptionLabel.text = teamDeatails.strDescriptionEN
        yearLabel.text = teamDeatails.intFormedYear
        print("")
        print(teamDeatails.strWebsite ?? "error")
        print("ffff")
    }
    
    
    func link (){
        
        let url: String = "https://"
        
        let webSiteString = NSMutableAttributedString(string: "Website")
        let webSiteUrl = URL(string: url+(teamDeatails.strWebsite ?? ""))
        let facebookString = NSMutableAttributedString(string: "Facebook")
        let facebookUrl = URL(string: url+(teamDeatails.strFacebook ?? ""))
        let InstString = NSMutableAttributedString(string: "Instagram")
        let instUrl = URL(string: url+(teamDeatails.strInstagram ?? "" ))
        let twitterString = NSMutableAttributedString(string: "Twitter")
        let twitterUrl = URL(string: url+(teamDeatails.strTwitter ?? "" ))
        
        webSiteString.setAttributes([.link: webSiteUrl ?? ""], range: NSMakeRange(0, 7))
        facebookString.setAttributes([.link: facebookUrl ?? ""], range: NSMakeRange(0, 8))
        InstString.setAttributes([.link: instUrl ?? ""], range: NSMakeRange(0, 9))
        twitterString.setAttributes([.link: twitterUrl ?? ""], range: NSMakeRange(0, 7))
        
        self.websiteLinkTextView.attributedText = webSiteString
        self.websiteLinkTextView.isUserInteractionEnabled = true
        self.websiteLinkTextView.isEditable = false
        self.websiteLinkTextView.linkTextAttributes = [.foregroundColor: UIColor.black,.underlineStyle: NSUnderlineStyle.single.rawValue ]
        
        self.facebookLinkTextView.attributedText = facebookString
        self.facebookLinkTextView.isUserInteractionEnabled = true
        self.facebookLinkTextView.isEditable = false
        self.facebookLinkTextView.linkTextAttributes = [.foregroundColor: UIColor.black,.underlineStyle: NSUnderlineStyle.single.rawValue ]
        
        self.instagramLinkTextView.attributedText = InstString
        self.instagramLinkTextView.isUserInteractionEnabled = true
        self.instagramLinkTextView.isEditable = false
        self.instagramLinkTextView.linkTextAttributes = [.foregroundColor: UIColor.black,.underlineStyle: NSUnderlineStyle.single.rawValue ]
        
        self.twitterLinkTextView.attributedText = twitterString
        self.twitterLinkTextView.isUserInteractionEnabled = true
        self.twitterLinkTextView.isEditable = false
        self.twitterLinkTextView.linkTextAttributes = [.foregroundColor: UIColor.black,.underlineStyle: NSUnderlineStyle.single.rawValue ]
    }

}

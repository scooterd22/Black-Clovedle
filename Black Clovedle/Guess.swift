//
//  MatchupsTableViewCell.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 8/7/24.
//

import UIKit

class Guess: UITableViewCell {

    @IBOutlet weak var characterDebutArch: UIImageView!
    @IBOutlet weak var characterSpirit: UIImageView!
    @IBOutlet weak var characterMAffiliation: UIImageView!
    @IBOutlet weak var characterAffiliation: UIImageView!
    @IBOutlet weak var characterGender: UIImageView!
    @IBOutlet weak var characterText: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}

//
//  CharacterCorrectViewController.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 9/12/24.
//

import UIKit
import Foundation
import SwiftUI


class CharacterCorrectViewController: UIViewController {
    var correctCharacter = ""
    var correctImage = ""
    @IBOutlet weak var todaysCharacter: UILabel!
    @IBOutlet weak var todaysCharacterImage: UIImageView?
    @IBOutlet weak var countdown: UILabel!

    override func viewDidLoad() {
        todaysCharacter.text = "Today's character was \(correctCharacter)"
//        todaysCharacterImage.image =
        print(todaysCharacterImage)
    }
    
    
}

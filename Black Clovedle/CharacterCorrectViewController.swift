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
    var correctImageSecondView: UIImage?
    @IBOutlet weak var todaysCharacter: UILabel!
    @IBOutlet weak var todaysCharacterImage: UIImageView?
    @IBOutlet weak var countdown: UILabel!
    var timer = Timer()
    

    override func viewDidLoad() {
        countdownTimerUpdate()
        startTimer()
        todaysCharacter.text = "Today's character was \(correctCharacter)"
        todaysCharacterImage?.image = correctImageSecondView
        print("this is todays character \(todaysCharacterImage)")
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        countdownTimerUpdate()
        
    }
    
    
    
    func countdownTimerUpdate() {
        var myMilliseconds = Int((Date().millisecondsUntilTheNextDay)/60000)
        var myHours = Int((Date().millisecondsUntilTheNextDay)/60000/60)
        var myMinutes = (myMilliseconds % 60)
        print(myMilliseconds)
        if myMinutes < 10 {
            countdown.text = String("\(myHours):0\(myMinutes)")
    //        }else if myMilliseconds >= 0 {
    //            countdown.text = String("\(myHours):\(myMinutes)")
    //            navigationController?.popViewController(animated: true)
    //
    //            dismiss(animated: true, completion: nil)
    //            
    //            timer.invalidate()
            
            
            // perform segue at midnight
        }else {
            countdown.text = String("\(myHours):\(myMinutes)")
        }
        
        
        
    }
    
    
}

extension Date {
    var startOfNextDay: Date {
        Calendar.current.nextDate(after: self, matching: DateComponents(hour: 0, minute: 0), matchingPolicy: .nextTimePreservingSmallerComponents)!
    }
    var millisecondsUntilTheNextDay: TimeInterval {
        startOfNextDay.timeIntervalSince(self) * 1000
    }
}

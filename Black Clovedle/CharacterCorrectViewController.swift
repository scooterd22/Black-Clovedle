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
    @IBOutlet weak var totalCorrect: UILabel!
    var timer = Timer()
    var guessingScreen = ViewController()
    var allTimeCorrect = UserDefaults.standard.integer(forKey: "All-Time Correct")
    var currentDate = "currentDate"
    let df = DateFormatter()
    
 
    

    override func viewDidLoad() {
        df.dateFormat = "MM/dd"
        currentDate = df.string(from: Date())
        print("this is the current date \(currentDate)")
        updateTotalCorrect()
        countdownTimerUpdate()
        startTimer()
        todaysCharacter.text = "Today's character was \(correctCharacter)"
        todaysCharacterImage?.image = correctImageSecondView
        print("this is todays character \(String(describing: todaysCharacterImage))")
        UserDefaults.standard.set(correctCharacter ,forKey: "winningCharacter")
        print("test")

    }
    
    func updateTotalCorrect() {
        let lastUpdatedDate = UserDefaults.standard.string(forKey: "lastUpdatedDate") ?? ""
            if currentDate != lastUpdatedDate {
                // Increment all-time correct only if today's date is new
                allTimeCorrect += 1
                UserDefaults.standard.set(allTimeCorrect, forKey: "All-Time Correct")
                UserDefaults.standard.set(currentDate, forKey: "lastUpdatedDate")
            }
            updateTotalCorrectLabel()
        }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        countdownTimerUpdate()
        
    }
    
    func updateTotalCorrectLabel() {
        totalCorrect.text = "All-time correct: \(allTimeCorrect)"
    }
    
    
    
    func countdownTimerUpdate() {
        
        let myMilliseconds = Int((Date().millisecondsUntilTheNextDay)/60000)
        let myHours = Int((Date().millisecondsUntilTheNextDay)/60000/60)
        let myMinutes = (myMilliseconds % 60)
        let mySeconds = (Int(Date().millisecondsUntilTheNextDay) / 1000) % 60
        if myHours <= 0 { // its past midnight
            countdown.text = String("\(myHours):\(myMinutes)")
            dismiss(animated: true, completion: nil)
            timer.invalidate()
        } else if myMinutes < 10 && mySeconds < 10 {
            countdown.text = String("\(myHours):0\(myMinutes):0\(mySeconds)")
        } else if mySeconds < 10 {
            countdown.text = String("\(myHours):\(myMinutes):0\(mySeconds)")
        } else if myMinutes < 10 {
            countdown.text = String("\(myHours):0\(myMinutes):\(mySeconds)")
        }else if myMinutes > 0{ // its not midnight yet{
                countdown.text = String("\(myHours):\(myMinutes):\(mySeconds)")
                df.dateFormat = "MM/dd"
                let lastDatePlayed = df.string(from: Date())
                UserDefaults.standard.set(lastDatePlayed, forKey: "lastDatePlayed")

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

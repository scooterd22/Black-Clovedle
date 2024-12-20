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
    
//    var lastDatePlayed = UserDefaults.standard.set(Date(), forKey: "lastDatePlayed")
//    var currentDatePlayed = UserDefaults.standard.set(Date(), forKey: "currentDatePlayed")
    

    override func viewDidLoad() {
        df.dateFormat = "MM/dd"
        let currentDate = df.string(from: Date())
        print("this is the current date \(currentDate)")
        countdownTimerUpdate()
        startTimer()
        todaysCharacter.text = "Today's character was \(correctCharacter)"
        todaysCharacterImage?.image = correctImageSecondView
        print("this is todays character \(todaysCharacterImage)")
        updateTotalCorrect()
        UserDefaults.standard.set(correctCharacter ,forKey: "winningCharacter")
        print("test")
//        UserDefaults.standard.set(Date(), forKey: "lastDatePlayed")
//        let date = UserDefaults.standard.object(forKey: "lastDatePlayed") as! Date
//        let df = DateFormatter()
//        df.dateFormat = "dd/MM/yyyy"
//        print(df.string(from: date))
    }
    
    func updateTotalCorrect() {
        allTimeCorrect += 1
        totalCorrect.text = "All-time correct: \(allTimeCorrect)"
        UserDefaults.standard.set(allTimeCorrect, forKey: "All-Time Correct")
//        print("the daily character was guessed: \(mainView.dailyCharacterGuessed)")
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
        print(myMinutes)
        if myMinutes > 0{ // its not midnight yet{
            countdown.text = String("\(myHours):0\(myMinutes)")
            guessingScreen.dailyGamePlayed = true
            UserDefaults.standard.set(true, forKey: "dailyGamePlayed")
            print(guessingScreen.dailyGamePlayed)
            
            df.dateFormat = "MM/dd"
            let lastDatePlayed = df.string(from: Date())
            print("this was the last date they played \(lastDatePlayed)")
            UserDefaults.standard.set(lastDatePlayed, forKey: "lastDatePlayed")
            print("stop")
            
            }else if myMilliseconds <= 0 { // its past midnight
                countdown.text = String("\(myHours):\(myMinutes)")
                dismiss(animated: true, completion: nil)
                guessingScreen.dailyGamePlayed = false
                UserDefaults.standard.setValue(false, forKey: "dailyGamePlayed")
                print(guessingScreen.dailyGamePlayed)
                timer.invalidate()

        }else {
            countdown.text = String("\(myHours):\(myMinutes)")
        }
        
        if guessingScreen.dailyGamePlayed == false {
            
        }else {
            
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

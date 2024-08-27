//
//  ViewController.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 8/7/24.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var guessingTableView: UITableView!
    @IBOutlet weak var tryAgain: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guessText: UITextField!
    var correctName: String?
    var numberOfGuesses = 0
    var guesses = [String]()
    //var character = Character()
    var randomCharacter = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomCharacter()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "Guess", bundle: nil), forCellReuseIdentifier: "GuessCell")
        // Do any additional setup after loading the view.
    }


    @IBAction func submitPressed(_ sender: Any) {
        numberOfGuesses += 1
        print(correctName!)
        if guessText.text?.lowercased() == correctName!.lowercased(){
            guesses.append(guessText.text!.capitalized)
            print("success")
            tryAgain.text = "great job!"
            self.tableView.reloadData()
        } else {
            guesses.append(guessText.text!.capitalized)
            //here see if its in the database
            // //character they guessed.gender == randomCharacter.gender  {
                
            }
                //howdo i do this line
                
                
                // see if the character they guessed has the same gender as the random character
                // i need the character they guessed
                // i need the gender of the character they guessed
                // i need the randomcharacter gender
            
            
            
            
            print(guesses)
            tryAgain.text = "try again!"
            self.tableView.reloadData()
            //append it to table view with correct data points!
        }
        
            
    
    func getRandomCharacter() {
        if let randomCharacter = characters.randomElement() {
            print("Random Character: \(randomCharacter.name), Gender: \(randomCharacter.gender) Affiliation: \(randomCharacter.affiliation), Magic Attribute: \(randomCharacter.magicAttribute), Debut Arch: \(randomCharacter.debutArc)")
            correctName = randomCharacter.name
                } else {
                    print("error")
                }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfGuesses
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuessCell", for: indexPath) as! Guess
        if guesses.count > 0 {
            cell.characterText.text = guesses[numberOfGuesses - indexPath.row - 1]
        } else {
            cell.characterText.text = guesses[indexPath.row]
        }
        return cell
    }
     
    
    
    
    
    
    
    
}


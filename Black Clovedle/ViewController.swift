//
//  ViewController.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 8/7/24.
//

import UIKit
import Foundation
import SwiftUI

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var selectedItemLabel: UILabel!
    @IBOutlet weak var guessingTableView: UITableView!
    @IBOutlet weak var tryAgain: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guessText: UITextField!
    var correctName: String?
    var correctGender: String?
    var correctAffiliation: String?
    var correctMagicAttribute: String?
    var correctDebutArch: String?
    var correctSpirit: String?
    var correctImage: UIImage?
    var numberOfGuesses = 0
    var guesses = [String]()
    var gender = [UIImage]()
    // the two below could be images
    var affiliation = [UIImage]()
    var magicAttribute = [UIImage]()
    var debutArch = [UIImage]()
    var spirit = [UIImage]()
    var genderTextArray = [String]()
    var affiliationTextArray = [String]()
    var magicTextArray = [String]()
    var spiritTextArray = [String]()
    var debutArchTextArray = [String]()
    var characterImagesArray = [UIImage]()
    var randomCharacter = Character.self
    //Calvin here I put an Array of Character Names but would love to be able to just use character info
    let characterNames = ["Asta", "Yuno", "Noelle Silva", "Yami Sukehiro", "Mimosa Vermillion", "Luck Voltia", "Fuegoleon Vermillion", "Nozel Silva", "Charlotte Roselei", "William Vangeance", "Julius Novachrono", "Magna Swing", "Vanessa Enoteca", "Finral Roulacase", "Gauche Adlai", "Charmy Pappitson", "Gordon Agrippa", "Grey", "Secre Swallowtail", "Klaus Lunettes", "Hamon Caseus", "Alecdora Sandler", "Letoile Becquerel", "Langris Vaude", "Rhya The Disloyal", "Licht", "Vetto The Despair", "Fana The Hatred", "Sally", "Rades Spirito", "Valtos", "Rill Boismortier", "Kirsch Vermillion", "Zora Ideale", "Dorothy Unsworth", "Leopold Vermillion", "Damnatio Kira", "Dante Zogratis", "Liebe", "Zagred", "Gadjah", "Gueldre", "Henry", "Jack the Ripper", "Kaiser Granvorka", "Kirsch Vermillion", "Klaus Lunettes", "Letoile Becquerel", "Lily Aquaria", "Loropechika", "Mars", "Mereoleona Vermillion", "Nacht Faust", "Nebra Silva", "Ralph Niaflem", "Sekke Bronzazza", "Sol Marron", "Solid Silva", "Undine", "Vanica", "Zenon Zogratis"]
    
    
    
    var filteredData: [String] = []
    let characterInfo = CharacterInfo()
    let characterUpdates = Guess()
    let greenCorrectImage = UIImage(named: "greenCorrect")
    var correctArchNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        dismissKeyboard()
        tableView.dataSource = self
        tableView.delegate = self
        guessingTableView.dataSource = self
        guessingTableView.delegate = self
        guessText.delegate = self
        guessText.addTarget(self, action: #selector(TextfieldDidChange(_:)), for: .editingChanged)
        tableView.register(UINib(nibName: "Guess", bundle: nil), forCellReuseIdentifier: "GuessCell")
        guessingTableView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        let guessedCharacter = guessText.text!.capitalized
        print(guessedCharacter)
        print(correctName!)
        if guessedCharacter == correctName!.capitalized{
            guesses.append(guessText.text!.capitalized)
            print("success")
            tryAgain.text = "Great job!"
            numberOfGuesses += 1
            self.tableView.reloadData()
            guessText.text = ""
            performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
            //            presentViewController(CharacterCorrectViewController, animated: true, completion: nil)
            //
            //wait 1 second timer then transition to other screen
        } else if guesses.contains(guessedCharacter) {
            tryAgain.text = "You've already guessed this character"
            guessText.text = ""
        } else if characterNames.contains(guessedCharacter.capitalized) && guessedCharacter.lowercased() != correctName!.lowercased(){
            guesses.append(guessText.text!.capitalized)
            tryAgain.text = "Try again!"
            print(guesses)
            numberOfGuesses += 1
            self.tableView.reloadData()
            guessText.text = ""
        } else {
            tryAgain.text = "Character not found"
            guessText.text = ""
            
        }
        
        
        
        let characterObject = characterInfo.characters.filter{ $0.name == guessedCharacter}.first
        if characterObject == nil {
            print("cannot find character in database")
        } else {
            print("object: \(characterObject!.name)")
            
            if correctGender == characterObject?.gender {
                print("same gender as random character")
                gender.append(UIImage(named: "greenCorrectTwo")!)
                genderTextArray.append(correctGender!)
            } else{
                print("not the correct gender as random character")
                gender.append(UIImage(named: "redWrongThree")!)
                genderTextArray.append(characterObject!.gender)
            }
            
            if correctAffiliation == characterObject?.affiliation {
                print("same affiliation as random character")
                affiliation.append(UIImage(named: "greenCorrectTwo")!)
                affiliationTextArray.append(characterObject!.affiliation)
                //                affliation.append(correctAffiliation!)
                
            }else{
                print("not the same affiliation as random character")
                //                affliation.append(characterObject!.affiliation)
                affiliation.append(UIImage(named: "redWrongThree")!)
                affiliationTextArray.append(characterObject!.affiliation)
                
            }
            if correctMagicAttribute == characterObject?.magicAttribute {
                print("the same magic attribute as random character")
                magicAttribute.append(UIImage(named: "greenCorrectTwo")!)
                magicTextArray.append(characterObject!.magicAttribute)
            }else {
                print("not the same magic attribute as random character")
                magicAttribute.append(UIImage(named: "redWrongThree")!)
                magicTextArray.append(characterObject!.magicAttribute)
            }
            
            if correctDebutArch == characterObject?.debutArc {
                print("the same debut arch as the random character")
                debutArch.append(UIImage(named: "greenCorrectTwo")!)
                debutArchTextArray.append(characterObject!.debutArc)
            } else {
                print ("not the same debut arch as the random character")
                if correctArchNumber < characterObject!.arcNumber{
                    debutArch.append(UIImage(named: "redArrowDown")!)
                } else{
                    debutArch.append(UIImage(named: "redArrowUp")!)
                }
                debutArchTextArray.append(characterObject!.debutArc)
            }
            if correctSpirit == characterObject?.spirit {
                print("the same spirit as the random character")
                spirit.append(UIImage(named: "greenCorrectTwo")!)
                spiritTextArray.append(characterObject!.spirit!)
            }else {
                print("not the same spirit as the random character")
                spirit.append(UIImage(named: "redWrongThree")!)
                spiritTextArray.append(characterObject!.spirit!)
            }
            if correctImage == characterObject?.imageName {
                print("image is correct")
                characterImagesArray.append(characterObject!.imageName!)
            }else {
                characterImagesArray.append(characterObject!.imageName!)
            }
            
        }
    }
    
    func getRandomCharacter() {
        if let randomCharacter = characterInfo.characters.randomElement() {
            print("Random Character: \(randomCharacter.name), Gender: \(randomCharacter.gender) Affiliation: \(randomCharacter.affiliation), Magic Attribute: \(randomCharacter.magicAttribute), Debut Arch: \(randomCharacter.debutArc), Arch Number: \(randomCharacter.debutArc)")
            correctName = randomCharacter.name
            correctGender = randomCharacter.gender
            correctAffiliation = randomCharacter.affiliation
            correctMagicAttribute = randomCharacter.magicAttribute
            correctDebutArch = randomCharacter.debutArc
            correctSpirit = randomCharacter.spirit
            correctImage = randomCharacter.imageName
            correctArchNumber = randomCharacter.arcNumber
//            print("this is the right thing \(correctImage)")
        } else {
            print("error")
        }
    }
    
    @IBAction func buttonToReset(_ sender: Any) {
        resetGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharacterCorrectViewController" {
            if let destinationVC = segue.destination as? CharacterCorrectViewController {
                destinationVC.correctCharacter = correctName!
                destinationVC.correctImageSecondView = UIImage(named: "\(correctName!)")
            }
        }
    }
    
    
    func resetGame(){
        guessText.text = ""
        getRandomCharacter()
        tryAgain.text = "Guess today's Black Clover Character!"
        numberOfGuesses = 0
        guesses = []
        gender = [UIImage]()
        affiliation = [UIImage]()
        magicAttribute = [UIImage]()
        debutArch = [UIImage]()
        spirit = [UIImage]()
        genderTextArray = [String]()
        affiliationTextArray = [String]()
        magicTextArray = [String]()
        spiritTextArray = [String]()
        debutArchTextArray = [String]()
        characterImagesArray = [UIImage]()
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return numberOfGuesses
        } else {
            return filteredData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "GuessCell", for: indexPath) as! Guess
            if guesses.count > 0 {
                //            cell.characterText!.text = guesses[numberOfGuesses - indexPath.row - 1]
                cell.characterGender!.image = gender[numberOfGuesses - indexPath.row - 1]
                cell.characterAffiliation!.image = affiliation[numberOfGuesses - indexPath.row - 1]
                cell.characterMAffiliation!.image = magicAttribute[numberOfGuesses - indexPath.row - 1]
                cell.characterDebutArch!.image = debutArch[numberOfGuesses - indexPath.row - 1]
                cell.characterSpirit!.image = spirit[numberOfGuesses - indexPath.row - 1]
                cell.genderText.text = genderTextArray[numberOfGuesses - indexPath.row - 1]
                cell.magicAffiliationText.text = magicTextArray[numberOfGuesses - indexPath.row - 1]
                cell.affiliationText.text = affiliationTextArray[numberOfGuesses - indexPath.row - 1]
                cell.spiritText.text = spiritTextArray[numberOfGuesses - indexPath.row - 1]
                cell.debutArchText.text = debutArchTextArray[numberOfGuesses - indexPath.row - 1]
                cell.characterImage?.image = characterImagesArray[numberOfGuesses - indexPath.row - 1]
            } else {
                //            cell.characterText!.text = guesses[numberOfGuesses - indexPath.row - 1]
                cell.characterGender!.image = gender[numberOfGuesses - indexPath.row - 1]
                cell.characterAffiliation!.image = affiliation[numberOfGuesses - indexPath.row - 1]
                cell.characterMAffiliation!.image = magicAttribute[numberOfGuesses - indexPath.row - 1]
                cell.characterDebutArch!.image = debutArch[numberOfGuesses - indexPath.row - 1]
                cell.characterSpirit!.image = spirit[numberOfGuesses - indexPath.row - 1]
                cell.genderText.text = genderTextArray[numberOfGuesses - indexPath.row - 1]
                cell.magicAffiliationText.text = magicTextArray[numberOfGuesses - indexPath.row - 1]
                cell.affiliationText.text = affiliationTextArray[numberOfGuesses - indexPath.row - 1]
                cell.spiritText.text = spiritTextArray[numberOfGuesses - indexPath.row - 1]
                cell.debutArchText.text = debutArchTextArray[numberOfGuesses - indexPath.row - 1]
                cell.characterImage?.image = characterImagesArray[numberOfGuesses - indexPath.row - 1]
            }
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = filteredData[indexPath.row]
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if tableView == self.tableView {
            
        } else {
            guessText.text = filteredData[indexPath.row]
            guessingTableView.isHidden = false
            guessText.resignFirstResponder()
        }
        
        
        
    }
    
    
    @objc func TextfieldDidChange(_ guessText: UITextField) {
        filterData()
    }
    
    func filterData() {
        let searchText = guessText.text ?? ""
        filteredData = characterNames.filter({
            $0.lowercased().contains(searchText.lowercased())
        })
        guessingTableView.reloadData()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guessingTableView.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guessingTableView.isHidden = true
    }
    
    
    
}

extension ViewController {
    
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(self.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}




//
//  ViewController.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 8/7/24.
//

import UIKit
import Foundation
import SwiftUI
import CryptoKit

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var selectedItemLabel: UILabel!
    @IBOutlet weak var guessingTableView: UITableView!
    @IBOutlet weak var tryAgain: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guessText: UITextField!
    @IBOutlet weak var chevron: UIButton!
    @IBOutlet weak var submit: UIButton!
    var tapDismissView: UIView!
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
    let characterNames = ["Asta", "Yuno", "Noelle Silva", "Yami Sukehiro", "Mimosa Vermillion", "Luck Voltia", "Fuegoleon Vermillion", "Nozel Silva", "Charlotte Roselei", "William Vangeance", "Julius Novachrono", "Magna Swing", "Vanessa Enoteca", "Finral Roulacase", "Gauche Adlai", "Charmy Pappitson", "Gordon Agrippa", "Grey", "Secre Swallowtail", "Klaus Lunettes", "Hamon Caseus", "Alecdora Sandler", "Letoile Becquerel", "Langris Vaude", "Rhya The Disloyal", "Licht", "Vetto The Despair", "Fana The Hatred", "Sally", "Rades Spirito", "Valtos", "Rill Boismortier", "Kirsch Vermillion", "Zora Ideale", "Dorothy Unsworth", "Leopold Vermillion", "Damnatio Kira", "Dante Zogratis", "Liebe", "Zagred", "Gadjah", "Gueldre", "Henry", "Jack The Ripper", "Kaiser Granvorka", "Lily Aquaria", "Loropechika", "Mars", "Mereoleona Vermillion", "Nacht Faust", "Nebra Silva", "Ralph Niaflem", "Sekke Bronzazza", "Sol Marron", "Solid Silva", "Undine", "Vanica", "Zenon Zogratis"]
    var filteredData: [String] = []
    let characterInfo = CharacterInfo()
    let characterUpdates = Guess()
    let greenCorrectImage = UIImage(named: "greenCorrect")
    var correctArchNumber = 0
    var dailyGamePlayed = UserDefaults.standard.bool(forKey: "dailyGamePlayed")
    var currentDate = "currentDate"
    var allTimeCorrect = UserDefaults.standard.integer(forKey: "All-Time Correct")
    //    let characterCorrectController = CharacterCorrectViewController()
    var currentGameDate = UserDefaults.standard.string(forKey: "currentGameDate")
    var correctDailyCharacter = UserDefaults.standard.string(forKey: "correctDailyCharacter")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        submit.tintColor = .black
        tapDismissView = UIView(frame: view.bounds)
        tapDismissView.backgroundColor = UIColor.clear
        tapDismissView.isHidden = true
        tapDismissView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAndTable)))
        view.addSubview(tapDismissView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAndTable))
            tapGesture.cancelsTouchesInView = false
        
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd"
        currentDate = df.string(from: Date())
        super.viewDidLoad()
        print("ths viewdidload ran")
        //        resetGame()
        dismissKeyboard()
        tableView.dataSource = self
        tableView.delegate = self
        guessingTableView.dataSource = self
        guessingTableView.delegate = self
        guessText.delegate = self
        guessText.addTarget(self, action: #selector(TextfieldDidChange(_:)), for: .editingChanged)
        tableView.register(UINib(nibName: "Guess", bundle: nil), forCellReuseIdentifier: "GuessCell")
        guessingTableView.isHidden = true
        tableView.reloadData()
        
        if currentDate == UserDefaults.standard.string(forKey: "lastUpdatedDate") {
            correctName = UserDefaults.standard.string(forKey: "winningCharacter")
            performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
            
            
        }
        
        guessText.textContentType = .name
        
       
    }
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidappearran")
        updateCurrentDate()
        getRandomCharacter()
        tableView.reloadData()
        if currentDate == UserDefaults.standard.string(forKey: "lastUpdatedDate") {
            correctName = UserDefaults.standard.string(forKey: "winningCharacter")
            performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
        }
        if isKeyPresentInUserDefaults(key: "lastDatePlayed") == true {
            if UserDefaults.standard.object(forKey: "lastDatePlayed") as! String == currentDate {
                correctName = UserDefaults.standard.string(forKey: "winningCharacter")
                performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
                
            }
        } else{
            
        }
    }
    
    
    @objc func appDidBecomeActive() {
        print("app did become active")
        
        
        getRandomCharacter()
        loadGuessTable()
        updateCurrentDate()
        
        
        for guess in guesses {
            rebuildTable(name: guess)
            
        }
        
     
       
        
        
        if currentGameDate != currentDate {
            print("did this run?")
            resetGame()
            
        }
        
        
    }
    
//    
//    func saveImagesToUserDefaults(images: [UIImage], key: String) {
//        let imageDataArray = images.compactMap { $0.pngData() }
//        UserDefaults.standard.set(imageDataArray, forKey: key)
//    }
//
//    func loadImagesFromUserDefaults(key: String) -> [UIImage] {
//        guard let imageDataArray = UserDefaults.standard.array(forKey: key) as? [Data] else {
//            return []
//        }
//        return imageDataArray.compactMap { UIImage(data: $0) }
//    }

   
    
    @IBAction func Chevron(_ sender: Any) {
        changeChevronState()
    }
    
    
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    func changeChevronState() {
        if guessingTableView.isHidden == true {
            let chevronUp = UIImage(systemName: "chevron.up")
            chevron.setImage(chevronUp, for: .normal )
            guessingTableView.isHidden = false
        } else {
            let chevronDown = UIImage(systemName: "chevron.down")
            chevron.setImage(chevronDown, for: .normal )
            guessingTableView.isHidden = true
        }
        
    }
    
    
    @IBAction func submitPressed(_ sender: Any) {
        currentGameDate = currentDate
        UserDefaults.standard.set(currentGameDate, forKey: "currentGameDate")
        let guessedCharacter = guessText.text!.capitalized
        print(guessedCharacter)
        print(correctName!)
        let characterObject = characterInfo.characters.filter{ $0.name == guessedCharacter}.first
        if guessedCharacter == correctName!.capitalized{
            guesses.append(guessText.text!.capitalized)
            print("success")
            tryAgain.text = "Great job!"
            numberOfGuesses += 1
            self.tableView.reloadData()
            guessText.text = ""
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
        
            }else{
                print("not the same affiliation as random character")
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
                allTimeCorrect += 1
                UserDefaults.standard.set(allTimeCorrect, forKey: "All-Time Correct")
                UserDefaults.standard.set(currentDate, forKey: "lastUpdatedDate")
                performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
            }else {
                characterImagesArray.append(characterObject!.imageName!)
            }
            
            
            
            
        } else if guesses.contains(guessedCharacter) {
            tryAgain.text = "You've already guessed this character"
            guessText.text = ""
            
        } else if characterNames.contains(guessedCharacter.capitalized) && guessedCharacter.lowercased() != correctName!.lowercased(){
            guesses.append(guessText.text!.capitalized)
            tryAgain.text = "Try again!"
            print(guesses)
            numberOfGuesses += 1
            saveGuessTable()
            self.tableView.reloadData()
            guessText.text = ""
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
 
            }else{
                print("not the same affiliation as random character")
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
                allTimeCorrect += 1
                UserDefaults.standard.set(allTimeCorrect, forKey: "All-Time Correct")
                UserDefaults.standard.set(currentDate, forKey: "lastUpdatedDate")
                performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
            }else {
                characterImagesArray.append(characterObject!.imageName!)
            }
        } else {
            tryAgain.text = "Character not found"
            guessText.text = ""
            
        }
        
        
        if characterObject == nil {
            print("cannot find character in database")
        }
    }
    
    func saveGuessTable() {
        UserDefaults.standard.set(guesses, forKey: "guesses")
        

    }
    
    func loadGuessTable() {
        guesses = UserDefaults.standard.stringArray(forKey: "guesses") ?? []
    }
    
    func rebuildTable(name: String) {
        currentGameDate = currentDate
           UserDefaults.standard.set(currentGameDate, forKey: "currentGameDate")
           let guessedCharacter = name.capitalized
           let characterObject = characterInfo.characters.filter{ $0.name == guessedCharacter}.first
           
           if guessedCharacter == correctName!.capitalized {
               guesses.append(guessText.text!.capitalized)
               self.tableView.reloadData()
               
               if correctGender == characterObject?.gender {
                   gender.append(UIImage(named: "greenCorrectTwo")!)
                   genderTextArray.append(correctGender!)
               } else {
                   gender.append(UIImage(named: "redWrongThree")!)
                   genderTextArray.append(characterObject!.gender)
               }
               
               if correctAffiliation == characterObject?.affiliation {
                   affiliation.append(UIImage(named: "greenCorrectTwo")!)
                   affiliationTextArray.append(characterObject!.affiliation)
               } else {
                   affiliation.append(UIImage(named: "redWrongThree")!)
                   affiliationTextArray.append(characterObject!.affiliation)
               }
               
               if correctMagicAttribute == characterObject?.magicAttribute {
                   magicAttribute.append(UIImage(named: "greenCorrectTwo")!)
                   magicTextArray.append(characterObject!.magicAttribute)
               } else {
                   magicAttribute.append(UIImage(named: "redWrongThree")!)
                   magicTextArray.append(characterObject!.magicAttribute)
               }
               
               if correctDebutArch == characterObject?.debutArc {
                   debutArch.append(UIImage(named: "greenCorrectTwo")!)
                   debutArchTextArray.append(characterObject!.debutArc)
               } else {
                   if correctArchNumber < characterObject!.arcNumber {
                       debutArch.append(UIImage(named: "redArrowDown")!)
                   } else {
                       debutArch.append(UIImage(named: "redArrowUp")!)
                   }
                   debutArchTextArray.append(characterObject!.debutArc)
               }
               
               if correctSpirit == characterObject?.spirit {
                   spirit.append(UIImage(named: "greenCorrectTwo")!)
                   spiritTextArray.append(characterObject!.spirit!)
               } else {
                   spirit.append(UIImage(named: "redWrongThree")!)
                   spiritTextArray.append(characterObject!.spirit!)
               }
               
               if correctImage == characterObject?.imageName {
                   characterImagesArray.append(characterObject!.imageName!)
                   allTimeCorrect += 1
                   UserDefaults.standard.set(allTimeCorrect, forKey: "All-Time Correct")
                   UserDefaults.standard.set(currentDate, forKey: "lastUpdatedDate")
                   performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
               } else {
                   characterImagesArray.append(characterObject!.imageName!)
               }
               
           }  else if characterNames.contains(guessedCharacter.capitalized) && guessedCharacter.lowercased() != correctName!.lowercased() {
//               self.tableView.reloadData()
               
               if correctGender == characterObject?.gender {
                   gender.append(UIImage(named: "greenCorrectTwo")!)
                   genderTextArray.append(correctGender!)
               } else {
                   gender.append(UIImage(named: "redWrongThree")!)
                   genderTextArray.append(characterObject!.gender)
               }
               
               if correctAffiliation == characterObject?.affiliation {
                   affiliation.append(UIImage(named: "greenCorrectTwo")!)
                   affiliationTextArray.append(characterObject!.affiliation)
               } else {
                   affiliation.append(UIImage(named: "redWrongThree")!)
                   affiliationTextArray.append(characterObject!.affiliation)
               }
               
               if correctMagicAttribute == characterObject?.magicAttribute {
                   magicAttribute.append(UIImage(named: "greenCorrectTwo")!)
                   magicTextArray.append(characterObject!.magicAttribute)
               } else {
                   magicAttribute.append(UIImage(named: "redWrongThree")!)
                   magicTextArray.append(characterObject!.magicAttribute)
               }
               
               if correctDebutArch == characterObject?.debutArc {
                   debutArch.append(UIImage(named: "greenCorrectTwo")!)
                   debutArchTextArray.append(characterObject!.debutArc)
               } else {
                   if correctArchNumber < characterObject!.arcNumber {
                       debutArch.append(UIImage(named: "redArrowDown")!)
                   } else {
                       debutArch.append(UIImage(named: "redArrowUp")!)
                   }
                   debutArchTextArray.append(characterObject!.debutArc)
               }
               
               if correctSpirit == characterObject?.spirit {
                   spirit.append(UIImage(named: "greenCorrectTwo")!)
                   spiritTextArray.append(characterObject!.spirit!)
               } else {
                   spirit.append(UIImage(named: "redWrongThree")!)
                   spiritTextArray.append(characterObject!.spirit!)
               }
               
               if correctImage == characterObject?.imageName {
                   characterImagesArray.append(characterObject!.imageName!)
                   allTimeCorrect += 1
                   UserDefaults.standard.set(allTimeCorrect, forKey: "All-Time Correct")
                   UserDefaults.standard.set(currentDate, forKey: "lastUpdatedDate")
                   performSegue(withIdentifier: "CharacterCorrectViewController", sender: nil)
               } else {
                   characterImagesArray.append(characterObject!.imageName!)
               }
           }
    }
    
    
    
    
    
    func updateCurrentDate() {
        let df = DateFormatter()
        df.dateFormat = "MM/dd"
        currentDate = df.string(from: Date())
    }
    
    
    
    func getRandomCharacter() {
         let randomCharacter = getNameForToday()
            print("Random Character: \(randomCharacter.name), Gender: \(randomCharacter.gender) Affiliation: \(randomCharacter.affiliation), Magic Attribute: \(randomCharacter.magicAttribute), Debut Arch: \(randomCharacter.debutArc), Arch Number: \(randomCharacter.debutArc)")
            correctName = randomCharacter.name
            correctGender = randomCharacter.gender
            correctAffiliation = randomCharacter.affiliation
            correctMagicAttribute = randomCharacter.magicAttribute
            correctDebutArch = randomCharacter.debutArc
            correctSpirit = randomCharacter.spirit
            correctImage = randomCharacter.imageName
            correctArchNumber = randomCharacter.arcNumber
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharacterCorrectViewController" {
            if let destinationVC = segue.destination as? CharacterCorrectViewController {
                destinationVC.modalPresentationStyle = .fullScreen
                destinationVC.correctCharacter = correctName!
                destinationVC.correctImageSecondView = UIImage(named: "\(correctName!)")
            }
        }
    }
    
    func resetGame(){
        getRandomCharacter()
        guessText.text = ""
        tryAgain.text = "Guess today's Black Clover Character!"
        //        tryAgain.text = correctName
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
                // the numberofguesses - indexpath.row - 1 get you the reverse order inputted
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == guessingTableView {
            guessText.text = filteredData[indexPath.row]
//            guessingTableView.isHidden = true
            changeChevronState()
            tapDismissView.isHidden = true // Hide overlay when selecting an item
            
            guessText.resignFirstResponder()
        }
    }

    @objc func dismissKeyboardAndTable() {
//        guessingTableView.isHidden = true
        changeChevronState()
        tapDismissView.isHidden = true // Hide the overlay when dismissed
        view.endEditing(true)
    }
    
    
    
    @objc func TextfieldDidChange(_ guessText: UITextField) {
        guessingTableView.isHidden = false
        let chevronUp = UIImage(systemName: "chevron.up")
        chevron.setImage(chevronUp, for: .normal )
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
        if let globalFrame = guessText.superview?.convert(guessText.frame, to: self.view) {
            let tableViewY = globalFrame.origin.y + globalFrame.height
            guessingTableView.frame = CGRect(x: globalFrame.origin.x, y: tableViewY, width: globalFrame.width, height: 300)
        }
        
        let totalHeight = guessingTableView.contentSize.height
        for constraint in guessingTableView.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = totalHeight
            }
        }
        guessingTableView.layer.borderWidth = 1.0
        guessingTableView.layer.borderColor = UIColor.black.cgColor
        guessingTableView.layer.cornerRadius = 5.0
        guessingTableView.clipsToBounds = true
        
    }
    
    
    @objc func dismissKeyboard() {
            if !guessingTableView.isHidden {
                changeChevronState()
            } else {
                view.endEditing(true)
            }

    }

    func getNameForToday() -> Character {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayString = formatter.string(from: Date())
        let hash = sha256Hash(todayString)
    let index = hash % characterInfo.characters.count
    return characterInfo.characters[index]
    }
   
    func sha256Hash(_ input: String) -> Int {
        let data = Data(input.utf8)
        let hash = SHA256.hash(data: data)
        let hashBytes = Array(hash.prefix(8))
        let hashValue = hashBytes.reduce(0) { ($0 << 8) | Int($1) }
        return abs(hashValue)
    }
    
    
     
    
}

extension ViewController {
    
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}




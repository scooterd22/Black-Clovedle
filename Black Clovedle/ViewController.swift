//
//  ViewController.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 8/7/24.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var selectedItemLabel: UILabel!
    @IBOutlet weak var guessingTableView: UITableView!
    @IBOutlet weak var tryAgain: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var guessText: UITextField!
    var correctName: String?
    var numberOfGuesses = 0
    var guesses = [String]()
    var randomCharacter: String?
    let characterNames = [
        "Asta", "Yuno", "Noelle Silva", "Yami Sukehiro", "Mimosa Vermillion",
        "Luck Voltia", "Fuegoleon Vermillion", "Nozel Silva", "Charlotte Roselei",
        "William Vangeance", "Julius Novachrono", "Magna Swing", "Vanessa Enoteca",
        "Finral Roulacase", "Gauche Adlai", "Charmy Pappitson", "Gordon Agrippa",
        "Grey", "Secre Swallowtail", "Klaus Lunettes", "Hamon Caseus",
        "Alecdora Sandler", "Letoile Becquerel", "Langris Vaude", "Rhya the Disloyal",
        "Patolli (Licht)", "Vetto the Despair", "Fana the Hatred", "Sally",
        "Rades Spirito", "Valtos", "Licht", "Rhya", "Patolli", "Rill Boismortier",
        "Kirsch Vermillion", "Dorothy Unsworth", "Jack the Ripper", "Charlotte Roselei",
        "Sol Marron", "Mereoleona Vermillion", "Leopold Vermillion", "Kaiser Granvorka",
        "Gueldre Poizot", "Nacht Faust", "Henry Legolant", "Zora Ideale",
        "Rades Spirito", "Valtos", "Morgen Faust", "Ralph Niaflem", "Svenkin Gatard",
        "Zenon Zogratis", "Vanica Zogratis", "Dante Zogratis", "Loropechika", "Gadjah",
        "Undine", "Zennon Zogratis", "Morbius", "Morris Libardirt", "Lucifero",
        "Zagred", "Liebe", "Gimodelo", "Etagel"
    ]
    var filteredData: [String] = []
    let characterInfo = CharacterInfo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomCharacter()
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
        numberOfGuesses += 1
        print(correctName!)
        if guessText.text?.lowercased() == correctName!.lowercased(){
            guesses.append(guessText.text!.capitalized)
            print("success")
            tryAgain.text = "great job!"
            self.tableView.reloadData()
        } else {
            //capitlizing
            guesses.append(guessText.text!.capitalized)
            var guessedCharacter = guessText.text!
            let characterObject = characterInfo.characters.filter{ $0.name == guessedCharacter}.first
            if characterObject == nil {
                print("cannot find character in database")
            } else {
                print("object: \(characterObject!.name)")
//                print(randomCharacter.gender)
//                if randomCharacter.gender == String(characterObject?.gender) {
//                    
//                }
                
                
                
                
                
                
                
                
                
            }
                
            
                
          
            
            
                }
             
            print(guesses)
            tryAgain.text = "try again!"
            self.tableView.reloadData()
            //append it to table view with correct data points!
        }
        
    func getRandomCharacter() {
        if let randomCharacter = characterInfo.characters.randomElement() {
            print("Random Character: \(randomCharacter.name), Gender: \(randomCharacter.gender) Affiliation: \(randomCharacter.affiliation), Magic Attribute: \(randomCharacter.magicAttribute), Debut Arch: \(randomCharacter.debutArc)")
            correctName = randomCharacter.name
                } else {
                    print("error")
                }
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
            cell.characterText.text = guesses[numberOfGuesses - indexPath.row - 1]
        } else {
            cell.characterText.text = guesses[indexPath.row]
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


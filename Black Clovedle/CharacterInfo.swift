//
//  CharacterInfo.swift
//  Black Clovedle
//
//  Created by Scott DiBenedetto on 8/27/24.
//

import Foundation
import UIKit

struct CharacterInfo {
    let characters = [
        Character(name: "Asta", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Anti-Magic", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Asta")),
        Character(name: "Yuno", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Wind", spirit: "Sylph", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Yuno")),
        Character(name: "Noelle Silva", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Water", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Noelle")),
        Character(name: "Yami Sukehiro", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Dark", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Yami")),
        Character(name: "Mimosa Vermillion", gender: "Female", affiliation: "Golden Dawn", magicAttribute: "Plant", spirit: "none", debutArc: "Dungeon Exploration", imageName: UIImage(named: "Mimosa")),
        Character(name: "Luck Voltia", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Lightning", spirit: "none", debutArc: "Dungeon Exploration", imageName: UIImage(named: "Luck")),
        Character(name: "Fuegoleon Vermillion", gender: "Male", affiliation: "Crimson Lion Kings", magicAttribute: "Fire", spirit: "Salamander", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Fuegoleon")),
        Character(name: "Nozel Silva", gender: "Male", affiliation: "Silver Eagles", magicAttribute: "Mercury", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Nozel")),
        Character(name: "Charlotte Roselei", gender: "Female", affiliation: "Blue Rose Knights", magicAttribute: "Briar", spirit: "none", debutArc: "Capital Suppression", imageName: UIImage(named: "Charlotte")),
        Character(name: "William Vangeance", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "World Tree", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "William")),
        Character(name: "Julius Novachrono", gender: "Male", affiliation: "Clover Kingdom", magicAttribute: "Time", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Julius")),
        Character(name: "Magna Swing", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Fire", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Magna")),
        Character(name: "Vanessa Enoteca", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Thread", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Vanessa")),
        Character(name: "Finral Roulacase", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Spatial", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Finral")),
        Character(name: "Gauche Adlai", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Mirror", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Gauche")),
        Character(name: "Charmy Pappitson", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Cotton", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Charmy")),
        Character(name: "Gordon Agrippa", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Poison", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Gordon")),
        Character(name: "Grey", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Transformation", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Grey")),
        Character(name: "Secre Swallowtail", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Sealing", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Secre")),
        Character(name: "Klaus Lunettes", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Steel", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Klaus")),
        Character(name: "Hamon Caseus", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Glass", spirit: "none", debutArc: "Dungeon Exploration", imageName: UIImage(named: "Hamon")),
        Character(name: "Alecdora Sandler", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Sand", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Alecdora")),
        Character(name: "Letoile Becquerel", gender: "Female", affiliation: "Golden Dawn", magicAttribute: "Compass", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Letoile")),
        Character(name: "Langris Vaude", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Spatial", spirit: "none", debutArc: "Capital Suppression", imageName: UIImage(named: "Langris")),
        Character(name: "Rhya the Disloyal", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Imitation", spirit: nil, debutArc: "Underwater Temple", imageName: UIImage(named: "Rhya")),
        Character(name: "Licht", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Light", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Licht")),
        Character(name: "Vetto the Despair", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Beast", spirit: "none", debutArc: "Seabed Temple", imageName: UIImage(named: "Vetto")),
        Character(name: "Fana the Hatred", gender: "Female", affiliation: "Eye of the Midnight Sun", magicAttribute: "Fire, Healing", spirit: "Salamander", debutArc: "Witch's Forest", imageName: UIImage(named: "Fana")),
        Character(name: "Sally", gender: "Female", affiliation: "Eye of the Midnight Sun", magicAttribute: "Gel", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Sally")),
        Character(name: "Rades Spirito", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Reanimation", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Rades")),
        Character(name: "Valtos", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Spatial", spirit: "none", debutArc: "Dungeon Exploration", imageName: UIImage(named: "Valtos")),
        Character(name: "Licht", gender: "Male", affiliation: "Elves", magicAttribute: "Sword", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Licht")),
        Character(name: "Rill Boismortier", gender: "Male", affiliation: "Aqua Deer", magicAttribute: "Painting", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Rill")),
        Character(name: "Kirsch Vermillion", gender: "Male", affiliation: "Coral Peacocks", magicAttribute: "Cherry Blossom", spirit: "none", debutArc: "Royal Knights Selection", imageName: UIImage(named: "Kirsch")),
        Character(name: "Dorothy Unsworth", gender: "Female", affiliation: "Coral Peacocks", magicAttribute: "Dream", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Dorothy")),
        Character(name: "Jack the Ripper", gender: "Male", affiliation: "Green Praying Mantises", magicAttribute: "Severing", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Jack")),
        Character(name: "Sol Marron", gender: "Female", affiliation: "Blue Rose Knights", magicAttribute: "Earth", spirit: "none", debutArc: "Capital Suppression", imageName: UIImage(named: "Sol")),
        Character(name: "Mereoleona Vermillion", gender: "Female", affiliation: "Crimson Lion Kings", magicAttribute: "Fire", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Mereoleona")),
        Character(name: "Leopold Vermillion", gender: "Male", affiliation: "Crimson Lion Kings", magicAttribute: "Fire", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Leopold")),
        Character(name: "Kaiser Granvorka", gender: "Male", affiliation: "Purple Orcas", magicAttribute: "Mist", spirit: "none", debutArc: "Royal Capital Assault", imageName: UIImage(named: "Kaiser")),
        Character(name: "Gueldre Poizot", gender: "Male", affiliation: "Purple Orcas", magicAttribute: "Invisible", spirit: "none", debutArc: "Magic Knight Entrance", imageName: UIImage(named: "Gueldre")),
        Character(name: "Nacht Faust", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Shadow", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: UIImage(named: "Nacht")),
        Character(name: "Henry Legolant", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Recombination", spirit: "none", debutArc: "Black Bulls Base", imageName: UIImage(named: "Henry")),
        Character(name: "Zora Ideale", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Trap", spirit: "none", debutArc: "Royal Knights Selection", imageName: UIImage(named: "Zora")),
        Character(name: "Ralph Niaflem", gender: "Male", affiliation: "Spade Resistance", magicAttribute: "Fire", spirit: "none", debutArc: "Heart Kingdom Joint Struggle", imageName: UIImage(named: "Ralph")),
        Character(name: "Zenon Zogratis", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Bone", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: UIImage(named: "Zenon")),
        Character(name: "Vanica Zogratis", gender: "Female", affiliation: "Dark Triad", magicAttribute: "Blood", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: UIImage(named: "Vancia")),
        Character(name: "Dante Zogratis", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Gravity", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: UIImage(named: "Dante")),
        Character(name: "Loropechika", gender: "Female", affiliation: "Heart Kingdom", magicAttribute: "Water", spirit: "Undine", debutArc: "Heart Kingdom Joint Struggle", imageName: UIImage(named: "Lolo")),
        Character(name: "Gadjah", gender: "Male", affiliation: "Heart Kingdom", magicAttribute: "Lightning", spirit: "none", debutArc: "Heart Kingdom Joint Struggle", imageName: UIImage(named: "Gadjah")),
        Character(name: "Undine", gender: "Female", affiliation: "Heart Kingdom", magicAttribute: "Water", spirit: "none", debutArc: "Heart Kingdom Joint Struggle", imageName: UIImage(named: "Undine")),
        Character(name: "Lucifero", gender: "Male", affiliation: "Devil", magicAttribute: "Gravity", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: UIImage(named: "Devil")),
        Character(name: "Liebe", gender: "Male", affiliation: "Devil", magicAttribute: "Anti-Magic", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: UIImage(named: "Liebe")),
    ]

}

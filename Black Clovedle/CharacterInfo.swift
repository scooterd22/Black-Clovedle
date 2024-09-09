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
//        Character(name: "Yuno", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Wind", spirit: "Sylph", debutArc: "Magic Knight Entrance", imageName: "yuno"),
//        Character(name: "Noelle Silva", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Water", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "noelle_silva"),
//        Character(name: "Yami Sukehiro", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Dark", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "yami_sukehiro"),
//        Character(name: "Mimosa Vermillion", gender: "Female", affiliation: "Golden Dawn", magicAttribute: "Plant", spirit: "none", debutArc: "Dungeon Exploration", imageName: "mimosa_vermillion"),
//        Character(name: "Luck Voltia", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Lightning", spirit: "none", debutArc: "Dungeon Exploration", imageName: "luck_voltia"),
//        Character(name: "Fuegoleon Vermillion", gender: "Male", affiliation: "Crimson Lion Kings", magicAttribute: "Fire", spirit: "Salamander", debutArc: "Royal Capital Assault", imageName: "fuegoleon_vermillion"),
//        Character(name: "Nozel Silva", gender: "Male", affiliation: "Silver Eagles", magicAttribute: "Mercury", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "nozel_silva"),
//        Character(name: "Charlotte Roselei", gender: "Female", affiliation: "Blue Rose Knights", magicAttribute: "Briar", spirit: "none", debutArc: "Capital Suppression", imageName: "charlotte_roselei"),
//        Character(name: "William Vangeance", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "World Tree", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "william_vangeance"),
//        Character(name: "Julius Novachrono", gender: "Male", affiliation: "Clover Kingdom", magicAttribute: "Time", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "julius_novachrono"),
//        Character(name: "Magna Swing", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Fire", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "magna_swing"),
//        Character(name: "Vanessa Enoteca", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Thread", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "vanessa_enoteca"),
//        Character(name: "Finral Roulacase", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Spatial", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "finral_roulacase"),
//        Character(name: "Gauche Adlai", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Mirror", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "gauche_adlai"),
//        Character(name: "Charmy Pappitson", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Cotton", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "charmy_pappitson"),
//        Character(name: "Gordon Agrippa", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Poison", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "gordon_agrippa"),
//        Character(name: "Grey", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Transformation", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "grey"),
//        Character(name: "Secre Swallowtail", gender: "Female", affiliation: "Black Bulls", magicAttribute: "Sealing", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "secre_swallowtail"),
//        Character(name: "Klaus Lunettes", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Steel", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "klaus_lunettes"),
//        Character(name: "Hamon Caseus", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Glass", spirit: "none", debutArc: "Dungeon Exploration", imageName: "hamon_caseus"),
//        Character(name: "Alecdora Sandler", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Sand", spirit: "none", debutArc: "Royal Capital Assault", imageName: "alecdora_sandler"),
//        Character(name: "Letoile Becquerel", gender: "Female", affiliation: "Golden Dawn", magicAttribute: "Compass", spirit: "none", debutArc: "Royal Capital Assault", imageName: "letoile_becquerel"),
//        Character(name: "Langris Vaude", gender: "Male", affiliation: "Golden Dawn", magicAttribute: "Spatial", spirit: "none", debutArc: "Capital Suppression", imageName: "langris_vaude"),
//        Character(name: "Rhya the Disloyal", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Imitation", spirit: nil, debutArc: "Underwater Temple", imageName: "rhya_the_disloyal"),
//        Character(name: "Patolli (Licht)", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Light", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "patolli_licht"),
//        Character(name: "Vetto the Despair", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Beast", spirit: "none", debutArc: "Seabed Temple", imageName: "vetto_the_despair"),
//        Character(name: "Fana the Hatred", gender: "Female", affiliation: "Eye of the Midnight Sun", magicAttribute: "Fire, Healing", spirit: "Salamander", debutArc: "Witch's Forest", imageName: "fana_the_hatred"),
//        Character(name: "Sally", gender: "Female", affiliation: "Eye of the Midnight Sun", magicAttribute: "Gel", spirit: "none", debutArc: "Royal Capital Assault", imageName: "sally"),
//        Character(name: "Rades Spirito", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Reanimation", spirit: "none", debutArc: "Royal Capital Assault", imageName: "rades_spirito"),
//        Character(name: "Valtos", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Spatial", spirit: "none", debutArc: "Dungeon Exploration", imageName: "valtos"),
//        Character(name: "Licht", gender: "Male", affiliation: "Elves", magicAttribute: "Sword", spirit: "none", debutArc: "Royal Capital Assault", imageName: "licht"),
//        Character(name: "Rhya", gender: "Male", affiliation: "Elves", magicAttribute: "Imitation", spirit: "none", debutArc: "Underwater Temple", imageName: "rhya"),
//        Character(name: "Patolli", gender: "Male", affiliation: "Elves", magicAttribute: "Light", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "patolli"),
//        Character(name: "Rill Boismortier", gender: "Male", affiliation: "Aqua Deer", magicAttribute: "Painting", spirit: "none", debutArc: "Royal Capital Assault", imageName: "rill_boismortier"),
//        Character(name: "Kirsch Vermillion", gender: "Male", affiliation: "Coral Peacocks", magicAttribute: "Cherry Blossom", spirit: "none", debutArc: "Royal Knights Selection", imageName: "kirsch_vermillion"),
//        Character(name: "Dorothy Unsworth", gender: "Female", affiliation: "Coral Peacocks", magicAttribute: "Dream", spirit: "none", debutArc: "Royal Capital Assault", imageName: "dorothy_unsworth"),
//        Character(name: "Jack the Ripper", gender: "Male", affiliation: "Green Praying Mantises", magicAttribute: "Severing", spirit: "none", debutArc: "Royal Capital Assault", imageName: "jack_the_ripper"),
//        Character(name: "Charlotte Roselei", gender: "Female", affiliation: "Blue Rose Knights", magicAttribute: "Briar", spirit: "none", debutArc: "Capital Suppression", imageName: "charlotte_roselei"),
//        Character(name: "Sol Marron", gender: "Female", affiliation: "Blue Rose Knights", magicAttribute: "Earth", spirit: "none", debutArc: "Capital Suppression", imageName: "sol_marron"),
//        Character(name: "Mereoleona Vermillion", gender: "Female", affiliation: "Crimson Lion Kings", magicAttribute: "Fire", spirit: "none", debutArc: "Royal Capital Assault", imageName: "mereoleona_vermillion"),
//        Character(name: "Leopold Vermillion", gender: "Male", affiliation: "Crimson Lion Kings", magicAttribute: "Fire", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "leopold_vermillion"),
//        Character(name: "Kaiser Granvorka", gender: "Male", affiliation: "Purple Orcas", magicAttribute: "Mist", spirit: "none", debutArc: "Royal Capital Assault", imageName: "kaiser_granvorka"),
//        Character(name: "Gueldre Poizot", gender: "Male", affiliation: "Purple Orcas", magicAttribute: "Invisible", spirit: "none", debutArc: "Magic Knight Entrance", imageName: "gueldre_poizot"),
//        Character(name: "Nacht Faust", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Shadow", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "nacht_faust"),
//        Character(name: "Henry Legolant", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Recombination", spirit: "none", debutArc: "Black Bulls Base", imageName: "henry_legolant"),
//        Character(name: "Zora Ideale", gender: "Male", affiliation: "Black Bulls", magicAttribute: "Trap", spirit: "none", debutArc: "Royal Knights Selection", imageName: "zora_ideale"),
//        Character(name: "Rades Spirito", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Reanimation", spirit: "none", debutArc: "Royal Capital Assault", imageName: "rades_spirito"),
//        Character(name: "Valtos", gender: "Male", affiliation: "Eye of the Midnight Sun", magicAttribute: "Spatial", spirit: "none", debutArc: "Dungeon Exploration", imageName: "valtos"),
//        Character(name: "Morgen Faust", gender: "Male", affiliation: "Grey Deer", magicAttribute: "Light", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "morgen_faust"),
//        Character(name: "Ralph Niaflem", gender: "Male", affiliation: "Spade Resistance", magicAttribute: "Fire", spirit: "none", debutArc: "Heart Kingdom Joint Struggle", imageName: "ralph_niaflem"),
//        Character(name: "Svenkin Gatard", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Skin", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "svenkin_gatard"),
//        Character(name: "Zenon Zogratis", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Bone", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "zenon_zogratis"),
//        Character(name: "Vanica Zogratis", gender: "Female", affiliation: "Dark Triad", magicAttribute: "Blood", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "vanica_zogratis"),
//        Character(name: "Dante Zogratis", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Gravity", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "dante_zogratis"),
//        Character(name: "Loropechika", gender: "Female", affiliation: "Heart Kingdom", magicAttribute: "Water", spirit: "Undine", debutArc: "Heart Kingdom Joint Struggle", imageName: "loropechika"),
//        Character(name: "Gadjah", gender: "Male", affiliation: "Heart Kingdom", magicAttribute: "Lightning", spirit: "none", debutArc: "Heart Kingdom Joint Struggle", imageName: "gadjah"),
//        Character(name: "Undine", gender: "Female", affiliation: "Heart Kingdom", magicAttribute: "Water", spirit: "none", debutArc: "Heart Kingdom Joint Struggle", imageName: "undine"),
//        Character(name: "Zennon Zogratis", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Bone", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "zennon_zogratis"),
//        Character(name: "Morbius", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Bone", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "morbius"),
//        Character(name: "Morris Libardirt", gender: "Male", affiliation: "Dark Triad", magicAttribute: "Modification", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "morris_libardirt"),
//        Character(name: "Lucifero", gender: "Male", affiliation: "Devil", magicAttribute: "Gravity", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "lucifero"),
//        Character(name: "Zagred", gender: "Male", affiliation: "Devil", magicAttribute: "Word Soul", spirit: "none", debutArc: "Elf Reincarnation", imageName: "zagred"),
//        Character(name: "Liebe", gender: "Male", affiliation: "Devil", magicAttribute: "Anti-Magic", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "liebe"),
//        Character(name: "Gimodelo", gender: "Male", affiliation: "Devil", magicAttribute: "Shadow", spirit: "none", debutArc: "Spade Kingdom Raid", imageName: "gimodelo"),
//        Character(name: "Etagel", gender: "Female", affiliation: "Heart Kingdom", magicAttribute: "Water", spirit: "Undine", debutArc: "Heart Kingdom Joint Struggle", imageName: "etage")
    ]

}

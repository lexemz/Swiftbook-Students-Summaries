//
//  AlexDataManeger.swift
//  Summaries
//
//  Created by Arcani on 18.09.2021.
//

class Dogs {
    static let shared = Dogs()
    
    let names = ["Milo", "Samus", "Powerwolf", "Slayer", "Cacodemon"]
    let favActivities = ["Playing", "Sleeping", "Running", "Barking", "Being cute"]
    
    private init () {}
}

class Cats {
    static let shared = Cats()
    
    let names = ["Mancubus", "Imp", "Loki", "Ocelot", "Kane"]
    let favActivities = ["Purring", "Sleeping", "Scratching", "Eating", "Hiding"]
    
    private init () {}
}

//
//  AlexUser.swift
//  Summaries
//
//  Created by Arcani on 19.09.2021.
//

class User {
    let name: String
    init(name: String) {
        self.name = name
    }
        static func getUser(name: String) -> User {
            User(name: name)
        }
    }

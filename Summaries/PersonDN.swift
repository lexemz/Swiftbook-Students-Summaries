//
//  PersonDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 13.09.2021.
//

struct Person {
    let name: String
    let surname: String
    
    let profession: Profession
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Дмитрий", surname: "Данилин", profession: Profession.getProfession())
    }
}

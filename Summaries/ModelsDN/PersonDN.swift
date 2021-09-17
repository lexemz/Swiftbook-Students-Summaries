//
//  PersonDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 13.09.2021.
//

struct PersonDN {
    let name: String
    let surname: String
    let age: Int
    let englishLevel: EnglishLevel
    let contact: String
    let hobbies: [String]
    
    let photo: String
    let profession: ProfessionDN
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> PersonDN {
        PersonDN(name: "Дмитрий",
               surname: "Данилин",
               age: 33,
               englishLevel: EnglishLevel.a2,
               contact: "zyfunphoto.ru",
               hobbies: ["Программирование",
                         "Настольные игры",
                         "Фотосъёмка",
                         "Велоспорт",
                         "Горные лыжи"],
               photo: "dmitriyPhoto",
               profession: ProfessionDN.getProfession())
    }
}

enum EnglishLevel: String {
    case a1 = "A1 (Beginner)"
    case a2 = "A2 (Elementary)"
    case b1 = "B1 (Intermediate)"
    case b2 = "B2 (Upper-Intermediate)"
    case c1 = "C1 (Advanced)"
    case c2 = "C2 (Proficiency)"
}

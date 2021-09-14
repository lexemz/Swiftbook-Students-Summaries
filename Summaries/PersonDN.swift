//
//  PersonDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 13.09.2021.
//

struct Person {
    let name: String
    let surname: String
    let age: Int
    let contact: String
    let hobbies: [String]
    
    let photo: Photo
    let profession: Profession
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Дмитрий",
               surname: "Данилин",
               age: 33,
               contact: "zyfunphoto.ru",
               hobbies: ["Программирование",
                         "Настольные игры",
                         "Фотосъёмка",
                         "Велоспорт",
                         "Горные лыжи"],
               photo: Photo.dmitriy,
               profession: Profession.getProfession())
    }
}


enum Photo: String {
    case dmitriy = "dmitriyPhoto"
}

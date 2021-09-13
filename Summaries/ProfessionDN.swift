//
//  ProfessionDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 13.09.2021.
//

struct Profession {
    let professionName: String
    let skills: [String]
    
    static func getProfession() -> Profession {
        Profession(professionName: "Trainee iOS Develop", skills: ["Xcode", "Swift", "UIKit", "CoreData", "Realm", "MVC", "GIT", "Работа в команде", "Уровень английского - А2"])
    }
}

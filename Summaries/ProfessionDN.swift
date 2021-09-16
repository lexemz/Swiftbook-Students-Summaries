//
//  ProfessionDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 13.09.2021.
//

struct Profession {
    let professionName: String
    let skills: [String]
    let englishLevel: EnglishLevel
    let projects: [Project]
    
    static func getProfession() -> Profession {
        Profession(professionName: "Trainee iOS Develop",
                   skills: ["Xcode",
                            "Swift",
                            "UIKit",
                            "CoreData",
                            "Realm",
                            "MVC",
                            "Git",
                            "Работа в команде"],
                   englishLevel: EnglishLevel.a2,
                   projects: Project.getProjects())
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

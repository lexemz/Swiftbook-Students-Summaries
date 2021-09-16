//
//  ProfessionDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 13.09.2021.
//

struct ProfessionDN {
    let professionName: String
    let skills: [String]
    let projects: [ProjectDN]
    
    static func getProfession() -> ProfessionDN {
        ProfessionDN(professionName: "Trainee iOS Develop",
                   skills: ["Xcode",
                            "Swift",
                            "UIKit",
                            "CoreData",
                            "Realm",
                            "MVC",
                            "Git",
                            "Работа в команде"],
                   projects: ProjectDN.getProjects())
    }
}

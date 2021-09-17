//
//  ModelIgor.swift
//  Summaries
//
//  Created by Igor on 17.09.2021.
//

struct PersonI {
    let name: String
    let surname: String
    let age: Int
    let city: String
    
    let contacts: [Contact]
    
    var hobbies: [Hobbie]
    var skills: [Skill]
    var projects: [Project]
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getIgorPersonModel() -> Self {
        let hobbies: [Hobbie] = [
            Hobbie(name: "Программирование"),
            Hobbie(name: "Сборка механических клавиатур")
        ]
        
        let skills: [Skill] = [
            Skill(title: "Git", skillLevel: .high),
            Skill(title: "Swift", skillLevel: .medium),
            Skill(title: "Docker", skillLevel: .low)
        ]
        
        let projects: [Project] = [
            Project(
                title: "PersonalityQuiz",
                descrition: "",
                link: "https://github.com/lexemz/PersonalityQuiz.git"
            ),
            
            Project(
                title: "Contacts",
                descrition: "",
                link: "https://github.com/lexemz/Contacts.git")
        ]
        
        let contacts = [
            Contact(contactType: "Telegram", id: "/lexemz", link: "link")
        ]
        
        
        return PersonI(
            name: "Igor",
            surname: "Buzykin",
            age: 22,
            city: "Moscow",
            contacts: contacts,
            hobbies: hobbies,
            skills: skills,
            projects: projects
        )
    }
}

struct Hobbie {
    let name: String
}

struct Skill {
    enum SkillLevel: String {
        case high = "Опытный"
        case medium = "Продолжающий"
        case low = "Начинающий"
    }
    
    let title: String
    let skillLevel: SkillLevel
}

struct Project {
    let title: String
    let descrition: String
    let link: String
}

struct Contact {
    let contactType: String
    let id: String
    let link: String
}

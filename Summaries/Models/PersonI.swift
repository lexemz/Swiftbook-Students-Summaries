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
    
    let hobbies: [Hobbie]
    let skills: [Skill]
    let projects: [Project]
    
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
                descrition: "Проект - персональный опросник",
                link: "https://github.com/lexemz/PersonalityQuiz.git"
            ),
            Project(
                title: "Contacts",
                descrition: "Приложение - автоматически генерирующийся список контактов",
                link: "https://github.com/lexemz/Contacts.git"
            ),
            Project(
                title: "ColorizeSuperview",
                descrition: "Приложение для смены цвета главного экрана через делегирование",
                link: "https://github.com/lexemz/ColorizeSuperview.git"
            ),
            Project(
                title: "Log-in-screen",
                descrition: "Экран авторизации с анкетой разработчика",
                link: "https://github.com/lexemz/Log-in-screen.git"
            ),
            Project(
                title: "Codewars-solutions",
                descrition: "Задачки с codewars",
                link: "https://github.com/lexemz/codewars-solutions.git"
            )
        ]
        
        let contacts = [
            Contact(
                contactType: "Telegram",
                id: "@lexemz",
                link: "t.me/lexemz"
            ),
            Contact(
                contactType: "VK",
                id: "/lexemz",
                link: "vk.com/lexemz"
            ),
            Contact(
                contactType: "GitHub",
                id: "lexemz",
                link: "github.com/lexemz"
            )
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

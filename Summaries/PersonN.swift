//
//  PersonN.swift
//  Summaries
//
//  Created by Nadzeya Shpakouskaya on 11/09/2021.
//
import Foundation

struct PersonN {
    let name: String
    let surname: String
    let sex: GenderN
    let dateOfBirth: String
    let address: String
    var photoLink: String?
    let contactInfo: ContactInfoN
    let expectedPosition: String
    let summary: String
    let skills: [String]
    let workPlaces: [WorkPlaceN]?
    let education: [EducationN]?
    let certificates: [CertificateN]?
    let projects: [ProjectN]?
    let languages: [LanguageN]
    let additionalInfo: [AdditionalInfoN]
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static var nadia = PersonN(
        name: "Nadzeya",
        surname: "Shpakouskaya",
        sex: .female,
        dateOfBirth: "27.09.1987",
        address: "Dubai, UAE",
        photoLink: "NadiaPhoto",
        contactInfo: ContactInfoN(
            phoneNumber: "+12345678",
            email: "nadia@email.com"),
        expectedPosition: "Junior iOS Developer",
        summary: "Good communication skills, ability to handle stress, a great desire to learn new technologies and improve the existing knowledge.",
        skills: ["Swift", "UIKit", "CoreData", "Core Animation", "Push Notifications", "Git", "Jira/Confluence"],
        workPlaces: [
            WorkPlaceN(
                company: "Company 1",
                position: "iOs Developer Intern",
                dateOfStart: "05.10.2020",
                dateOfFinishing: "03.01.2021",
                description: "Working as intern on prototype of product."
            ),
            WorkPlaceN(
                company: "Company 2",
                position: "iOs Developer Intern",
                dateOfStart: "05.10.2020",
                dateOfFinishing: "03.01.2021",
                description: "Working as intern on prototype of product."
            ),
            WorkPlaceN(
                company: "Company 3",
                position: "iOs Developer Intern",
                dateOfStart: "05.10.2020",
                dateOfFinishing: "03.01.2021",
                description: "Working as intern on prototype of product."
            ),
            WorkPlaceN(
                company: "Company 4",
                position: "iOs Developer Intern",
                dateOfStart: "05.10.2020",
                dateOfFinishing: "03.01.2021",
                description: "Working as intern on prototype of product."
            )
        ],
        education: [
            EducationN(
                name: "BSEU (Belarussian State Economy University)",
                levelDegree: .bachelor,
                specialization: "Management and economy at enterprises",
                dateOfStart: "Sept. 2006",
                dateOfFinishing: "Febr. 2012"),
            EducationN(
                name: "Minsk architecture and construction College",
                levelDegree: .associate,
                specialization: "Management and economy at contsruction",
                dateOfStart: "Sept. 2003",
                dateOfFinishing: "Jul. 2006")
        ],
        certificates: [
            CertificateN(
                title: "Basic Swift",
                company: "SwiftBook.ru",
                certificateLink: "https://alfa.swiftbook.ru/courses/219/download_certificate",
                dateOfIssue: "16.08.2021")
        ],
        projects: [
            ProjectN(
                title: "Color Picker",
                description: "Simple app you can change color using rgb sliders or values",
                linkAppStore: "n/a",
                linkGit: "https://github.com/NadzeyaShpakouskaya/SliderHomeWork.git"),
            ProjectN(
                title: "Contact List",
                description: "Simple app based on tabbar and tableviews displaying base information of contacts",
                linkAppStore: "n/a",
                linkGit: "https://github.com/NadzeyaShpakouskaya/ContactListApp"),
            ProjectN(
                title: "Personal resume",
                description: "Simple app about me",
                linkAppStore: "n/a",
                linkGit: "https://github.com/NadzeyaShpakouskaya/LoginHomeWork.git"),
        ],
        languages: [
            LanguageN(language: "Russian", level: .native),
            LanguageN(language: "English", level: .intermediate),
            LanguageN(language: "Belarussian", level: .native)
        ],
        additionalInfo: [
            AdditionalInfoN(title: "Hobby", description: "Cardboard games, to travel and spend time with family, rock music.")
        ]
    )
}
struct ContactInfoN {
    let phoneNumber: String
    let email: String
}

struct WorkPlaceN {
    let company: String
    let position: String
    let dateOfStart: String
    let dateOfFinishing: String
    let description: String
}

struct EducationN {
    let name: String
    let levelDegree: LevelDegreeN
    var specialization: String
    let dateOfStart: String
    let dateOfFinishing: String
}

struct CertificateN {
    let title: String
    var company: String
    let certificateLink: String
    let dateOfIssue: String
}

struct ProjectN {
    let title: String
    let description: String
    let linkAppStore: String?
    let linkGit: String?
}

struct LanguageN {
    let language: String
    let level: LanguageLevelN
}

struct AdditionalInfoN {
    let title: String
    let description: String
    
    var info: String {
        "\(title): \(description)"
    }
}

enum LevelDegreeN: String {
    case elementary = "Elementary"
    case highSchool = "High School"
    case associate = "Associate degree"
    case bachelor = "Bachelor's degree"
    case master = "Master's degree"
    case doctor = "Doctor's degree"
}

enum GenderN: String {
    case male, female
}

enum LanguageLevelN: String {
    case elementary
    case beginner
    case intermediate
    case advanced
    case native
}

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
        skills: ["Swift", "UIKit", "SOLID principle", "SwiftUI", "CoreData", "Core Animation", "Push Notifications", "Git", "Jira/Confluence"],
        workPlaces: [
            WorkPlaceN(
                company: "Company 1",
                position: "iOS Developer",
                dateOfStart: "03.01.2021",
                dateOfFinishing: "current",
                description: "Self-employment. Swiftbook course: Become iOS developer in 20 weeks"
            ),
            WorkPlaceN(
                company: "Company 2",
                position: "iOs Developer Intern",
                dateOfStart: "05.10.2020",
                dateOfFinishing: "03.01.2021",
                description: "Working as intern on prototype of app: list of properties."
            ),
            WorkPlaceN(
                company: "Company 3",
                position: "Leader of tutors",
                dateOfStart: "17.10.2015",
                dateOfFinishing: "05.10.2020",
                description: "Manage mentors and learning process of course."
            ),
            WorkPlaceN(
                company: "Company 4",
                position: "Logistic",
                dateOfStart: "17.05.2013",
                dateOfFinishing: "17.10.2015",
                description: "Working as logistics, manage the process of deliveries"
            )
        ],
        education: [
            EducationN(
                name: "BSEU (Belarusian State Economy University)",
                levelDegree: .bachelor,
                specialization: "Management and Economy at Enterprise",
                dateOfStart: "Sept. 2006",
                dateOfFinishing: "Febr. 2012"),
            EducationN(
                name: "Minsk State Architecture College",
                levelDegree: .associate,
                specialization: "Management and Economy at Construction",
                dateOfStart: "Sept. 2003",
                dateOfFinishing: "Jul. 2006")
        ],
        certificates: [
            CertificateN(
                title: "Basic Swift",
                company: "SwiftBook.ru",
                certificateLink: "https://alfa.swiftbook.ru/courses/219/download_certificate",
                dateOfIssue: "16.08.2021"),
            CertificateN(
                title: "Swift 5 Essential Training",
                company: "LinkedIn",
                certificateLink: "n/a",
                dateOfIssue: "11.04.2020"),
            CertificateN(
                title: "GIT. Basic",
                company: "Stepik.org",
                certificateLink: "https://stepik.org/certificate/2af1e9b438547fb9d6f1f4014f9f5b396cf506c5.pdf",
                dateOfIssue: "15.12.2017"),
            CertificateN(
                title: "Introduction into database",
                company: "Stepik.org",
                certificateLink: "https://stepik.org/certificate/009876d8292dfda5ee5b28d71a201d13ab81b393.pdf",
                dateOfIssue: "18.12.2017")
        ],
        projects: [
            ProjectN(
                title: "Color Picker",
                description: "Simple app you can change color using rgb sliders or values",
                linkAppStore: nil,
                linkGit: "https://github.com/NadzeyaShpakouskaya/SliderHomeWork.git",
                image: "ColorPicker"
            ),
            ProjectN(
                title: "Contact List",
                description: "Simple app based on tabbar and tableviews displaying base information of contacts",
                linkAppStore: nil,
                linkGit: "https://github.com/NadzeyaShpakouskaya/ContactListApp",
                image: "ContactList"
            ),
            ProjectN(
                title: "Personal resume",
                description: "Simple app providing basic information in resume style",
                linkAppStore: nil,
                linkGit: "https://github.com/NadzeyaShpakouskaya/LoginHomeWork.git",
                image: "PersonalResume"
            ),
            ProjectN(
                title: "Summaries group 22",
                description: "Collaboration app to practice workin in team using github.",
                linkAppStore: nil,
                linkGit: "https://github.com/lexemz/Swiftbook-Students-Summaries.git",
                image: "Summaries"
            ),
            ProjectN(
                title: "Game Level Helper",
                description: "The application help to manage the game process of Munchkin cards games.",
                linkAppStore: "http://itunes.apple.com/us/app/id1499312939&mt=8",
                linkGit: nil,
                image: nil
            )
        ],
        languages: [
            LanguageN(language: "Russian", level: .native),
            LanguageN(language: "English", level: .intermediate),
            LanguageN(language: "Belarusian", level: .native)
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
    let image: String?
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

enum DetailedInfoN {
    case work
    case certificate
    case education
    case project
}

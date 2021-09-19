//
//  ProjectDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 14.09.2021.
//

struct ProjectDN {
    let projectName: String
    let projectDescription: String
    let linkGitHub: String?
    
    static func getProjects() -> [ProjectDN] {
        [
            ProjectDN(projectName: "Two Views",
                    projectDescription: "Учебное приложения. Практика работы с констрейнтами",
                    linkGitHub: "https://github.com/ZyFun/TwoViews.git"),
            ProjectDN(projectName: "Traffic Light",
                    projectDescription: "Учебное приложение. Имитирует работу светофора в ручном управлении",
                    linkGitHub: "https://github.com/ZyFun/TrafficLight.git"),
            ProjectDN(projectName: "Login App",
                    projectDescription: "Учебное приложение. Имитация входа в систему. Практика переноса данных с одного экрана на другой",
                    linkGitHub: "https://github.com/ZyFun/LoginApp.git"),
            ProjectDN(projectName: "About Me",
                    projectDescription: "Учебное приложение. Имитация входа в систему. Практика переноса данных с одного экрана на другой. Практика создания архитектуры MVC",
                    linkGitHub: "https://github.com/ZyFun/AboutMe.git"),
            ProjectDN(projectName: "Personality Quiz",
                    projectDescription: "Учебное приложение. Шуточный опросник. Практика переноса данных с одного экрана на другой. Практика работы с архитектурой MVC. Практика работы с массивами.",
                    linkGitHub: "https://github.com/ZyFun/PersonalityQuiz.git"),
            ProjectDN(projectName: "RGB Setup",
                    projectDescription: "Учебное приложение. Изменяет цвет небольшой области, с помощью RGB ползунков. Практика использования протоколов и делегатов",
                    linkGitHub: "https://github.com/ZyFun/RGBSetup.git"),
            ProjectDN(projectName: "Contacts",
                    projectDescription: "Учебное приложение. Практика работы с TableView. Имитация загрузки данных с помощью мок объекта в сервисном слое. Практика передачи данных с tab bar controller, для отображения одинаковых данных на двух таблицах в разном виде. Используется новый способ отображения данных в ячейках, введеный с iOS 14",
                    linkGitHub: "https://github.com/ZyFun/Contacts.git")
        ]
    }
}

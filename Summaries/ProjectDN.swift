//
//  ProjectDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 14.09.2021.
//

struct Project {
    let projectName: String
    let projectDescription: String
    let linkAppStore: String?
    let linkGitHub: String?
    
    static func getProjects() -> [Project] {
        [
            Project(projectName: "Two Views",
                    projectDescription: "Учебное приложения. Практика работы с констрейнтами",
                    linkAppStore: nil,
                    linkGitHub: "https://github.com/ZyFun/TwoViews.git"),
            Project(projectName: "Traffic Light",
                    projectDescription: "Учебное приложение. Имитирует работу светофора в ручном управлении",
                    linkAppStore: nil,
                    linkGitHub: "https://github.com/ZyFun/TrafficLight.git")
        ]
    }
}

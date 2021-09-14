//
//  ProjectDN.swift
//  Summaries
//
//  Created by Дмитрий Данилин on 14.09.2021.
//

struct Project {
    let projectName: String
    let linkAppStore: String?
    let linkGitHub: String?
    
    static func getProjects() -> [Project] {
        [
            Project(projectName: "Two Views",
                    linkAppStore: nil,
                    linkGitHub: "https://github.com/ZyFun/TwoViews.git"),
            Project(projectName: "Traffic Light",
                    linkAppStore: nil,
                    linkGitHub: "https://github.com/ZyFun/TrafficLight.git")
        ]
    }
}

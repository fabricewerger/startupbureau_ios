
//  CourseTask.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 07/01/2022.


import Foundation


// MARK: - CourseTask
typealias CourseTask = [CourseTaskProperties]


// MARK: - CourseTaskProperties
struct CourseTaskProperties: Codable {
    let courseStepID: String
    let stepCompleted: Bool

    enum CodingKeys: String, CodingKey {
        case courseStepID = "courseStepId"
        case stepCompleted
    }
}

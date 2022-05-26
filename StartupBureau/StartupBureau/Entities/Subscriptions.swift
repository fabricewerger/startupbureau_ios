//
//  Subsciptions.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 07/12/2021.
//

import Foundation

// MARK: - CourseSubscriptions
typealias Subscriptions = [CourseSubscriptionsProperties]


// MARK: - CourseSubscriptionsProperties
struct CourseSubscriptionsProperties: Codable, Identifiable {
    let id, courseID, userID: String
    let options: [Option]?
    let currentStepNumber: Int
    let courseTasks: [CourseStep]

    enum CodingKeys: String, CodingKey {
        case id
        case courseID = "CourseId"
        case userID = "UserId"
        case options = "Options"
        case currentStepNumber = "CurrentStepNumber"
        case courseTasks = "CourseTasks"
    }
}

// MARK: - CourseTask
struct CourseStep: Codable {
    let courseStepID: String
    let stepCompleted: Bool

    enum CodingKeys: String, CodingKey {
        case courseStepID = "CourseStepId"
        case stepCompleted = "StepCompleted"
    }
}

// MARK: - Option
struct Option: Codable {
    let optionID: String

    enum CodingKeys: String, CodingKey {
        case optionID = "OptionId"
    }
}

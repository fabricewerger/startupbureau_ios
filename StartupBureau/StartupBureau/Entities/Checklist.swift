//
//  Checklist.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 17/01/2022.
//

import Foundation

// MARK: - Checklist
struct Checklist: Codable {
    let id, name, title, checklistDescription: String
    let price: Int
    let courseSteps: [CourseStepChecklist]
    let thumbNailID, bannerID: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "Name"
        case title = "Title"
        case checklistDescription = "Description"
        case price = "Price"
        case courseSteps = "CourseSteps"
        case thumbNailID = "ThumbNailId"
        case bannerID = "BannerId"
    }
}

// MARK: - CourseStep
struct CourseStepChecklist: Codable, Identifiable {
    let id: String
    let stepNum: Int
    let title: String
    let courseStepDescription: String?
//    let isLiked : Bool

    enum CodingKeys: String, CodingKey {
        case id
        case stepNum = "StepNum"
        case title = "Title"
        case courseStepDescription = "Description"
//        case isLiked = "Isliked"
    }
}

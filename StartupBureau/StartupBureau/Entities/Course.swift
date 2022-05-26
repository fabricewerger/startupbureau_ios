//
//  Course.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 24/11/2021.
//

import Foundation

// MARK: - Course
typealias Course = [CourseProperties]


// MARK: - CourseProperties
struct CourseProperties: Codable, Identifiable {
    let id, name: String
    let price: Int
    let title, welcomeDescription, thumbNailID, bannerID: String
    let createdDate, lastEdited: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "Name"
        case price = "Price"
        case title = "Title"
        case welcomeDescription = "Description"
        case thumbNailID = "ThumbNailId"
        case bannerID = "BannerId"
        case createdDate = "CreatedDate"
        case lastEdited = "LastEdited"
    }
}

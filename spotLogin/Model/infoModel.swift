//
//  infoModel.swift
//  spotLogin
//
//  Created by Siddhesh Redkar on 2019-11-27.
//  Copyright © 2019 Siddhesh Redkar. All rights reserved.
//

import Foundation


// MARK: - UserInfo
struct UserInfo: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let emailID, imageURL, firstName, lastName: String?

    enum CodingKeys: String, CodingKey {
        case emailID = "emailId"
        case imageURL = "imageUrl"
        case firstName, lastName
    }
}




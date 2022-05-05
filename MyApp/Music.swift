//
//  Music.swift
//  MyApp
//
//  Created by Kasun Gayashan on 05.02.22.
//  Copyright © 2022 Bear Cahill. All rights reserved.
//

import Foundation

struct Music: Codable {
    let id: String
    let musicURL: String
    let name, welcomeDescription, duration: String
    let image, thumb: String
    let createdBy, fileNameOriginal: String

    enum CodingKeys: String, CodingKey {
        case id
        case musicURL = "music_url"
        case name
        case welcomeDescription = "description"
        case duration, image, thumb
        case createdBy = "created_by"
        case fileNameOriginal = "file_name_original"
    }
}

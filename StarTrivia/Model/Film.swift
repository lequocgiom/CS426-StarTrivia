//
//  Film.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import Foundation

struct Film : Codable {
    let title : String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseDate = "release_date"
    }
}

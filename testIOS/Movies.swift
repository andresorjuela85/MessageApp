//
//  Movies.swift
//  testIOS
//
//  Created by Miguel Orjuela on 12/26/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import Foundation

struct Movies: Codable {
    let movies: [Movie]
}

struct Movie: Codable {
    let title: String
    let episode_id: Int
    let opening_crawl: String?
    let director: String?
    let producer: String?
    let release_date: String?
    var leido: Bool?
}

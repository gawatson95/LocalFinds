//
//  Places.swift
//  LocalFinds
//
//  Created by Grant Watson on 12/31/22.
//

import Foundation

struct Places: Codable {
    let results: [PlaceID]
}

struct PlaceID: Codable {
    let fsqID: String

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
    }
}

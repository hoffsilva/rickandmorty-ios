//
//  CharacterLocation.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 08/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

struct CharacterLocation: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

//
//  PokedexHome.swift
//  PokeDex
//
//  Created by Luis Ramirez on 13/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

struct PokedexHome: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PokemonHome]?
}

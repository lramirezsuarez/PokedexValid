//
//  Pokemon.swift
//  PokeDex
//
//  Created by Luis Ramirez on 14/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let height: Int?
    let moves: [Move]?
    let name: String?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case height
        case moves, name, sprites, stats, types, weight
    }
}

// MARK: - Sprites
struct Sprites: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}


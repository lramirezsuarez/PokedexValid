//
//  PokemonAbilities.swift
//  PokeDex
//
//  Created by Luis Ramirez on 15/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

// MARK: - Ability
struct Ability: Codable {
    let ability: AbilityObject?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct AbilityObject: Codable {
    let name: String?
    let url: String?
}
enum Abilities: String, Codable {
    case punch
}

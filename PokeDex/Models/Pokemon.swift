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
    let id: Int?
    let isDefault: Bool?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case height
        case id
        case isDefault = "is_default"
        case moves, name, order, sprites, stats, types, weight
    }
}

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

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: Species?
}

// MARK: - Species
struct Species: Codable {
    let name: SpeciesType?
    let url: String?
}

enum SpeciesType: String, Codable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fight
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case phsychic
    case poison
    case rock
    case steel
    case water
}

// MARK: - Move
struct Move: Codable {
    let move: MoveObject?

    enum CodingKeys: String, CodingKey {
        case move
    }
}

struct MoveObject: Codable {
    let name: String?
    let url: String?
}

// MARK: - Sprites
struct Sprites: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: StatObject?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct StatObject: Codable {
    let name: String?
    let url: String?
}

enum Statistic: String, Codable {
    case speed
}

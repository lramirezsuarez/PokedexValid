//
//  PokemonStats.swift
//  PokeDex
//
//  Created by Luis Ramirez on 15/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

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
    let name: Statistic?
    let url: String?
}

enum Statistic: String, Codable {
    case attack
    case defense
    case hp
    case specialAttack = "special-attack"
    case specialDefense = "special-defense"
    case speed
}

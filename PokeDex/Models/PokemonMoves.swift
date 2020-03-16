//
//  PokemonMoves.swift
//  PokeDex
//
//  Created by Luis Ramirez on 15/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

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

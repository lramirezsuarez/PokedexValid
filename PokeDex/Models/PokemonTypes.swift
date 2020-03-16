//
//  PokemonTypes.swift
//  PokeDex
//
//  Created by Luis Ramirez on 15/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

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

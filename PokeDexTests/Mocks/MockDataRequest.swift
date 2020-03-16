//
//  MockDataRequest.swift
//  PokeDexTests
//
//  Created by Luis Ramirez on 15/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation
@testable import PokeDex

struct MockDataRequest: DataRequestProtocol {
    static func loadPokedex(offset: Int, completion: @escaping ((PokedexHome?) -> Void)) {
        completion(PokedexHome(
            count: 10,
            next: "next10pokemon",
            previous: nil,
            results: [
            PokemonHome(name: "Bulbasur", url: "bulbasurUrl"),
            PokemonHome(name: "Charmander", url: "charmanderUrl"),
            PokemonHome(name: "Squirtle", url: "squirtleUrl"),
            PokemonHome(name: "Pikachu", url: "pikachuUrl")
        ]))
    }
    
    static func loadPokemonDetail(with url: String, completion: @escaping ((Pokemon?) -> Void)) {
        completion(Pokemon(
        abilities: [
            Ability(ability: AbilityObject(name: "punch", url: ""), isHidden: false, slot: 1)
        ],
        baseExperience: 200,
        height: 130,
        moves: [
            Move(move: MoveObject(name: "cut", url: ""))
        ],
        name: "pikachu",
        sprites: Sprites(frontDefault: "frontImage"),
        stats: [
            Stat(baseStat: 12, effort: 0, stat: StatObject(name: .hp, url: nil))
        ],
        types: [
            TypeElement(slot: 1, type: Species(name: .electric, url: ""))
        ],
        weight: 2))
    }
    
    
}

struct MockedModels {
    static let mockedPokedexHome = PokedexHome(
        count: 10,
        next: "next10pokemon",
        previous: nil,
        results: [
        PokemonHome(name: "Bulbasur", url: "bulbasurUrl"),
        PokemonHome(name: "Charmander", url: "charmanderUrl"),
        PokemonHome(name: "Squirtle", url: "squirtleUrl"),
        PokemonHome(name: "Pikachu", url: "pikachuUrl")
    ])
    
    static let mockedPokemonDetail = Pokemon(
        abilities: [
            Ability(ability: AbilityObject(name: "punch", url: ""), isHidden: false, slot: 1)
        ],
        baseExperience: 200,
        height: 130,
        moves: [
            Move(move: MoveObject(name: "cut", url: ""))
        ],
        name: "pikachu",
        sprites: Sprites(frontDefault: "frontImage"),
        stats: [
            Stat(baseStat: 12, effort: 0, stat: StatObject(name: .hp, url: nil))
        ],
        types: [
            TypeElement(slot: 1, type: Species(name: .electric, url: ""))
        ],
        weight: 2)
}

//
//  PokeDexTests.swift
//  PokeDexTests
//
//  Created by Luis Ramirez on 13/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import XCTest
@testable import PokeDex

class PokeDexTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testRequestPokedex() {
        MockDataRequest.loadPokedex(offset: 0) { pokedex in
            XCTAssert(MockedModels.mockedPokedexHome.results?.count == pokedex?.results?.count, "The results are not the same, failure")
        }
    }
    
    func testRequestPokemon() {
        MockDataRequest.loadPokemonDetail(with: "") { pokemon in
            XCTAssert(MockedModels.mockedPokemonDetail.name == pokemon?.name, "Wrong pokemon retrieved, failure.")
        }
    }

}

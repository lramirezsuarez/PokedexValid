//
//  DataRequest.swift
//  PokeDex
//
//  Created by Luis Ramirez on 13/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import Foundation

protocol DataRequestProtocol {
    static func loadPokedex(offset: Int, completion: @escaping ((PokedexHome?) -> Void))
    static func loadPokemonDetail(with url: String, completion: @escaping ((Pokemon?) -> Void))
}

struct DataRequest: DataRequestProtocol {

    static func loadPokedex(offset: Int, completion: @escaping ((PokedexHome?) -> Void)) {
        loadPokedexFromNetwork(offset: offset) { pokedex in
            guard let networkPokedex = pokedex else {
                completion(nil)
                return
            }
            completion(networkPokedex)
        }
    }
    
    static func loadPokemonDetail(with url: String, completion: @escaping ((Pokemon?) -> Void)) {
        loadPokemonFromNetwork(with: url) { pokemonDetail in
            guard let pokemonDetail = pokemonDetail else {
                completion(nil)
                return
            }
            completion(pokemonDetail)
        }
    }
    
    static private func loadPokedexFromNetwork(offset: Int, completion: @escaping ((PokedexHome?) -> Void)) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/pokemon"
        components.query = "offset=\(offset)&limit=20"
        let jsonDecoder = JSONDecoder()
        
        guard let url = components.url,
            let timeoutInterval = TimeInterval(exactly: 300) else {
            preconditionFailure("Failed to construct URL")
        }
        let taskConfiguration = URLSessionConfiguration.default
        taskConfiguration.timeoutIntervalForRequest = timeoutInterval
        
        let urlSession = URLSession(configuration: taskConfiguration)
        let task = urlSession.dataTask(with: url) {
            data, response, error in
            
            DispatchQueue.main.async {
                if let data = data {
                    let pokedexDecoded = try? jsonDecoder.decode(PokedexHome.self, from: data)
                    completion(pokedexDecoded)
                } else {
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
    
    static private func loadPokemonFromNetwork(with url: String, completion: @escaping ((Pokemon?) -> Void)) {
        let jsonDecoder = JSONDecoder()

        guard let url = URL(string: url),
            let timeoutInterval = TimeInterval(exactly: 300) else {
            preconditionFailure("Failed to construct URL")
        }
        let taskConfiguration = URLSessionConfiguration.default
        taskConfiguration.timeoutIntervalForRequest = timeoutInterval

        let urlSession = URLSession(configuration: taskConfiguration)
        let task = urlSession.dataTask(with: url) {
            data, response, error in

            DispatchQueue.main.async {
                if let data = data {
                    let pokemonDecoded = try? jsonDecoder.decode(Pokemon.self, from: data)
                    completion(pokemonDecoded)
                } else {
                    completion(nil)
                }
            }
        }

        task.resume()
    }
}

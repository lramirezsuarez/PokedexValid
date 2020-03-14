//
//  PokedexHomeViewController.swift
//  PokeDex
//
//  Created by Luis Ramirez on 13/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import UIKit

final class PokedexHomeViewController: UIViewController {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokedex: PokedexHome?
    var pokemons: [PokemonHome] = []
    var currentOffset = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        DataRequest.loadPokedex(offset: currentOffset) { pokedex in
            guard let pokedex = pokedex, let pokemons = pokedex.results else {
                return
            }
            self.pokedex = pokedex
            self.pokemons.append(contentsOf: pokemons)
            self.pokemonTableView.reloadData()
        }
    }
}

extension PokedexHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell") else {
            return UITableViewCell()
        }
        let pokemon = pokemons[indexPath.row]
        cell.textLabel?.text = pokemon.name?.capitalized
        
        return cell
    }
}

extension PokedexHomeViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if let pokemonAmount = pokedex?.count, currentOffset >= 0 && currentOffset < pokemonAmount {
            if (currentOffset + 20) > pokemonAmount {
                let pokemonLeft = pokemonAmount - currentOffset
                currentOffset += pokemonLeft
            } else {
                currentOffset += 20
            }
            loadData()
        }
    }
}

extension PokedexHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonHome = pokemons[indexPath.row]
        
        guard let pokemonUrl = pokemonHome.url else {
            return
        }
        
        DataRequest.loadPokemonDetail(with: pokemonUrl) { [weak self] pokemon in
            guard let strongSelf = self,
                let pokemon = pokemon,
                let pokemonDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "\(PokemonDetailViewController.self)") as? PokemonDetailViewController else {
                return
            }
            
            pokemonDetailViewController.pokemon = pokemon
            strongSelf.present(pokemonDetailViewController, animated: true, completion: nil)
        }
        
    }
}

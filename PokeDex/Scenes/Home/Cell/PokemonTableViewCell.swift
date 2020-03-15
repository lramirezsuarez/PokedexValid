//
//  PokemonTableViewCell.swift
//  PokeDex
//
//  Created by Luis Ramirez on 13/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import UIKit

final class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokeballImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with pokemon: PokemonHome) {
        guard let name = pokemon.name else {
            return
        }
        pokemonNameLabel.text = name.capitalized
    }
    
}

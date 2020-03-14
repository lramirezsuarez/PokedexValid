//
//  PokemonDetailViewController.swift
//  PokeDex
//
//  Created by Luis Ramirez on 14/03/20.
//  Copyright © 2020 Lucho. All rights reserved.
//

import UIKit
import Kingfisher

final class PokemonDetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemon: Pokemon?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let name = pokemon?.name, let imageString = pokemon?.sprites?.frontDefault, let imageUrl = URL(string: imageString) else {
            return
        }
        pokemonNameLabel.text = name
        pokemonImageView.kf.indicatorType = .activity
        pokemonImageView.kf.setImage(with: imageUrl)
    }

}

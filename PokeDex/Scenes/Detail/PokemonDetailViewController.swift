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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var pokemonTypesStackView: UIStackView!
    @IBOutlet weak var pokemonTypesStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonBaseExpLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonStatsStackView: UIStackView!
    @IBOutlet weak var pokemonStatsHeightStackView: NSLayoutConstraint!
    @IBOutlet weak var pokemonAbilitiesTextView: UITextView!
    @IBOutlet weak var pokemonMovesTextView: UITextView!
    
    
    var pokemon: Pokemon?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let name = pokemon?.name,
            let imageString = pokemon?.sprites?.frontDefault,
            let imageUrl = URL(string: imageString) else {
            return
        }
        backgroundColorForMainView()
        detailView.layer.cornerRadius = 15.0
        
        pokemonNameLabel.text = name.capitalized
        pokemonImageView.kf.indicatorType = .activity
        pokemonImageView.kf.setImage(with: imageUrl)
        addTypes()
        pokemonCharacteristics()
        pokemonStats()
        pokemonAbilitiesAndMoves()
    }
    
    private func backgroundColorForMainView() {
        guard let type = pokemon?.types?.first(where: { $0.slot == 1 }),
            let specie = type.type?.name else {
            return
        }
        switch specie {
        case .bug:
            containerView.backgroundColor = UIColor(hexString: "#92BC2C")
        case .dark:
        containerView.backgroundColor = UIColor(hexString: "#595761")
        case .dragon:
        containerView.backgroundColor = UIColor(hexString: "#0C69C8")
        case .electric:
        containerView.backgroundColor = UIColor(hexString: "#EDD53E")
        case .fairy:
        containerView.backgroundColor = UIColor(hexString: "#EC8CE5")
        case .fight:
        containerView.backgroundColor = UIColor(hexString: "#CE4265")
        case .fire:
        containerView.backgroundColor = UIColor(hexString: "#FB9B51")
        case .flying:
        containerView.backgroundColor = UIColor(hexString: "#90A7DA")
        case .ghost:
        containerView.backgroundColor = UIColor(hexString: "#516AAC")
        case .grass:
        containerView.backgroundColor = UIColor(hexString: "#5FBC51")
        case .ground:
        containerView.backgroundColor = UIColor(hexString: "#DC7545")
        case .ice:
        containerView.backgroundColor = UIColor(hexString: "#70CCBD")
        case .normal:
        containerView.backgroundColor = UIColor(hexString: "#9298A4")
        case .phsychic:
        containerView.backgroundColor = UIColor(hexString: "#F66F71")
        case .poison:
        containerView.backgroundColor = UIColor(hexString: "#A864C7")
        case .rock:
        containerView.backgroundColor = UIColor(hexString: "#C5B489")
        case .steel:
        containerView.backgroundColor = UIColor(hexString: "#52869D")
        case .water:
        containerView.backgroundColor = UIColor(hexString: "#559EDF")
        }
    }
    
    private func addTypes() {
        guard var types = pokemon?.types else {
            return
        }
        
        types.sort(by: { type1, type2 in
            guard let slot1 = type1.slot, let slot2 = type2.slot else {
                return false
            }
            return slot1 < slot2
        })
        
        pokemonTypesStackViewWidthConstraint.constant = CGFloat(70 * types.count)
        
        types.forEach({ type in
            let imageView = UIImageView(image: UIImage(named: type.type?.name?.rawValue ?? "normal"))
            imageView.contentMode = .scaleAspectFill
            imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
            pokemonTypesStackView.addArrangedSubview(imageView)
        })
        
    }
    
    private func pokemonCharacteristics() {
        guard let baseExp = pokemon?.baseExperience,
            let height = pokemon?.height,
            let weight = pokemon?.weight else {
            return
        }
        
        pokemonBaseExpLabel.text = "Base EXP: \(baseExp)"
        pokemonHeightLabel.text = "Height: \(height)"
        pokemonWeightLabel.text = "Weight: \(weight)"
    }
    
    private func pokemonStats() {
        guard var stats = pokemon?.stats else {
            return
        }
        
        stats.sort(by: { stat1, stat2 in
            guard let firstStat = stat1.stat?.name?.rawValue,
                let secondStat = stat2.stat?.name?.rawValue else {
                return false
            }
            return firstStat < secondStat
        })
        
        stats.forEach { stat in
            guard let statName = stat.stat?.name, let statBase = stat.baseStat else {
                return
            }
            let statLabel = UILabel(frame: CGRect(x: 0, y: 0, width: pokemonStatsStackView.frame.width, height: 15))
            let attributedString = NSMutableAttributedString(string: "\(statName.rawValue.capitalized): ", attributes: [.font: UIFont.boldSystemFont(ofSize: 15)])
            attributedString.append(NSAttributedString(string: "\(statBase)", attributes: [.font: UIFont.systemFont(ofSize: 12)]))
            
            statLabel.attributedText = attributedString
            pokemonStatsStackView.addArrangedSubview(statLabel)
        }
        
        pokemonStatsHeightStackView.constant = CGFloat(20 + 16 * stats.count)
    }

    private func pokemonAbilitiesAndMoves() {
        guard let abilities = pokemon?.abilities,
            let moves = pokemon?.moves else {
            return
        }
        pokemonAbilitiesTextView.layer.cornerRadius = 10
        pokemonAbilitiesTextView.text = abilities.compactMap({ $0.ability?.name?.capitalized }).joined(separator: "\n")
        pokemonMovesTextView.layer.cornerRadius = 10
        pokemonMovesTextView.text = moves.compactMap({ $0.move?.name?.capitalized }).joined(separator: "\n")
    }
}

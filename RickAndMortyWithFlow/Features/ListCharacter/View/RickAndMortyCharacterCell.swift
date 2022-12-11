//
//  RickAndMortyCharacterCell.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Kingfisher

class RickAndMortyCharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    var character: CharacterViewData!
    
    func configureCell(with character: CharacterViewData) {
        let url = URL(string: character.image)
        self.characterImageView.kf.setImage(with: url)
        self.characterNameLabel.text = character.name
        self.character = character
    }
    
    override func prepareForReuse() {
        self.characterNameLabel.text = nil
        self.characterImageView.image = nil
    }
    
}

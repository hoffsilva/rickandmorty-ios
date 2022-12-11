//
//  DetailOfRickAndMortyCharacterCoordinator.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 09/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class DetailOfRickAndMortyCharacterCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension DetailOfRickAndMortyCharacterCoordinator {
    
    func detailRickAndMortyCharacter(_ character: CharacterViewData) {
        let detailView = DetailOfRickAndMortyCharacterView.instantiate()
        detailView.character = character
        navigationController.pushViewController(detailView, animated: true)
    }
    
}

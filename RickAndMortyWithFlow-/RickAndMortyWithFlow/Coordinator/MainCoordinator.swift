//
//  MainCoordinator.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 06/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Foundation

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let listOfRickAndMortyCharacterView = ListOfRickAndMortyCharacterView.instantiate()
        listOfRickAndMortyCharacterView.coordinator = self
        navigationController.pushViewController(listOfRickAndMortyCharacterView, animated: false)
    }
}

extension MainCoordinator {
    
    func detailRickAndMortyCharacter(_ character: CharacterViewData) {
        let child = DetailOfRickAndMortyCharacterCoordinator(navigationController: navigationController)
        child.detailRickAndMortyCharacter(character)
    }
    
    
}

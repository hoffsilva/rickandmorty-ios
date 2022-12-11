//
//  ListCharacterCoordinator.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import UIKit

class ListCharacterCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { }
    
}

extension ListCharacterCoordinator {
    
    func detailCharacter(_ characterViewData: CharacterViewData) {
//        let detailBook = BookDetailView.instantiate()
//        navigationController.pushViewController(detailBook, animated: true)
    }
    
}

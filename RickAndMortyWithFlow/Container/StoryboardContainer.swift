//
//  StoryboardContainer.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 06/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        let mainContainer = MainContainer.sharedContainer.container
     
        defaultContainer.storyboardInitCompleted(ListOfRickAndMortyCharacterView.self) { (_, controller) in
            controller.viewModel = mainContainer.resolve(RxListCharacterViewModel.self)!
        }
        
        defaultContainer.storyboardInitCompleted(DetailOfRickAndMortyCharacterView.self) { (_, controller) in
            controller.viewmodel = mainContainer.resolve(RxDetailRickAndMortyCharcterViewModel.self)!
        }
    
    }
}

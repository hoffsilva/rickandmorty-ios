//
//  MainContainer.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 06/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import Swinject
import Moya

final class MainContainer {
    
    static let sharedContainer = MainContainer()
    
    let container = Container()
    
    private init() {
        self.setupDefaultContainers()
    }
    
    private func setupDefaultContainers() {
        registerService()
        registerViewModel()
        registerRepository()
        registerViewController()
    }
    
}

extension MainContainer {
    
    private func registerService() {
        
        self.container.register(RxListCharacterService.self) { resolver in
            let provider = MoyaProvider<ListCharacterRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])
            return RxListCharacterServiceImpl(
                provider: provider
            )
        }
        
    }
    
    private func registerRepository() {
        
        self.container.register(RxListCharacterRepository.self) { resolver in
            RxListCharacterRepositoryImpl(
                service: resolver.resolve(RxListCharacterService.self)!
            )
        }
        
    }
    
    private func registerViewController() {
        
        self.container.register(ListOfRickAndMortyCharacterView.self) { resolver in
            resolver.resolve(ListOfRickAndMortyCharacterView.self)!
        }

        self.container.register(DetailOfRickAndMortyCharacterView.self) { resolver in
            resolver.resolve(DetailOfRickAndMortyCharacterView.self)!
        }
        
    }
    
    private func registerViewModel() {
        
        self.container.register(RxListCharacterViewModel.self) { resolver in
            RxListCharacterViewModel(
                repository: resolver.resolve(RxListCharacterRepository.self)!
            )
        }
        
        self.container.register(RxDetailRickAndMortyCharcterViewModel.self) { resolver in
            RxDetailRickAndMortyCharcterViewModel(
                repository: resolver.resolve(RxListCharacterRepository.self)!
            )
        }
        
    }
    
}

//
//  DetailRickAndMortyCharcterViewModel.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 10/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxReachability

struct RxDetailRickAndMortyCharcterViewModelInput {
    let trigger: Driver<String>
}

struct RxDetailRickAndMortyCharcterViewModelOutput {
    let locationName: Driver<String>
    let locationType: Driver<String>
}

class RxDetailRickAndMortyCharcterViewModel {
    
    private var repository: RxListCharacterRepository
    
    init(repository: RxListCharacterRepository) {
        self.repository = repository
    }
    
    func transform(input: RxDetailRickAndMortyCharcterViewModelInput) -> RxDetailRickAndMortyCharcterViewModelOutput {
        
        let location = input.trigger.flatMap { locationID -> Driver<CharacterLocation> in
            return self.repository.detailLocationRx(by: locationID)
                .retry(30)
                .map { characterLocation in
                    characterLocation
            }.asDriver(onErrorDriveWith: .empty())
        }
        
        let name = location.map { location in
            location.name
        }
        
        let type = location.map { location in
            location.type
        }
        
        return RxDetailRickAndMortyCharcterViewModelOutput(
            locationName: name,
            locationType: type
        )
        
    }
    
}

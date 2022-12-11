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

struct DetailRickAndMortyCharcterViewModelInput {
    let trigger: Driver<String>
}

struct DetailRickAndMortyCharcterViewModelOutput {
    let locationName: Driver<String>
    let locationType: Driver<String>
}

class DetailRickAndMortyCharcterViewModel {
    
    private var repository: ListCharacterRepository
    
    init(repository: ListCharacterRepository) {
        self.repository = repository
    }
    
    func transform(input: DetailRickAndMortyCharcterViewModelInput) -> DetailRickAndMortyCharcterViewModelOutput {
        
        let location = input.trigger.flatMap { locationID -> Driver<CharacterLocation> in
            return self.repository.detailLocation(by: locationID)
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
        
        return DetailRickAndMortyCharcterViewModelOutput(
            locationName: name,
            locationType: type
        )
        
    }
    
}

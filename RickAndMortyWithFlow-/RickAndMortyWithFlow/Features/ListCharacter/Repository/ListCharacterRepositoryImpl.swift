//
//  ListCharacterRepositoryImpl.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 08/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import RxSwift
import Moya

class ListCharacterRepositoryImpl: ListCharacterRepository {
    
    let service: ListCharacterService
    
    init(service: ListCharacterService) {
        self.service = service
    }
    
    func filterCharcter(by name: String, in page: String) -> Single<CharacterResult> {
        return  self.service.findCharacter(by: name, in: page)
            .filter(statusCode: 200)
            .map({ response in
                return try response.map(CharacterResult.self)
            })
    }
    
    func detailLocation(by id: String) -> Single<CharacterLocation> {
        return self.service.detailLocation(by: id)
            .map { response in
                return try response.map(CharacterLocation.self)
        }
    }
    
}

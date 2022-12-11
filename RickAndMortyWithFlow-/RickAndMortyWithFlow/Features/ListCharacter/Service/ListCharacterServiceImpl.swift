//
//  ListCharacterServiceImpl.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Moya
import RxSwift

class ListCharacterServiceImpl: ListCharacterService {
    
    let provider: MoyaProvider<ListCharacterRouter>
    
    init(provider: MoyaProvider<ListCharacterRouter>) {
        self.provider = provider
    }
    
    func findCharacter(by characterName: String, in page: String) -> Single<Response> {
        self.provider.rx.request(.findCharacterBy(characterName, page))
    }
    
    func detailLocation(by id: String) -> Single<Response> {
        self.provider.rx.request(.detailLocation(id))
    }
    
}


//
//  ListCharacterServiceImpl.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Silva on 2022-12-11.
//  Copyright © 2022 Hoff Henry Pereira da Silva. All rights reserved.
//

import Moya

class ListCharacterServiceImpl: ListCharacterService {
    
    let provider: MoyaProvider<ListCharacterRouter>
    
    init(provider: MoyaProvider<ListCharacterRouter>) {
        self.provider = provider
    }
    
    func findCharacter(by characterName: String, in page: String, completion: @escaping ((Moya.Response) -> ())) {
        self.provider
            .request(.findCharacterBy(characterName, page)) { result in
                switch result {
                case .success(let response):
                    completion(response)
                case .failure: ()
                    
                }
            }
    }
    
    func detailLocation(by id: String, completion: @escaping ((Moya.Response) -> ())) {
        <#code#>
    }
    
}

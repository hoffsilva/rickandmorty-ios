//
//  RxListCharacterService.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Moya
import RxSwift

protocol RxListCharacterService {
    func findCharacter(by characterName: String, in page: String) -> Single<Response>
    func detailLocation(by id: String) -> Single<Response>
}

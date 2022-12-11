//
//  ListCharacterRepository.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import RxSwift
import Moya

protocol ListCharacterRepository {
    func filterCharcter(by name: String, in page: String) -> Single<CharacterResult>
    func detailLocation(by id: String) -> Single<CharacterLocation>
}

//
//  ListCharacterService.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Silva on 2022-12-11.
//  Copyright © 2022 Hoff Henry Pereira da Silva. All rights reserved.
//

import Moya

protocol ListCharacterService {
    func findCharacter(by characterName: String, in page: String, completion: @escaping ((Moya.Response)->()))
    func detailLocation(by id: String, completion: @escaping ((Moya.Response)->()))
}

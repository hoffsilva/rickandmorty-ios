//
//  ListCharacterRouter.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Moya

enum ListCharacterRouter {
    case findCharacterBy(_ characterName: String, _ page: String)
    case detailLocation(_ id: String)
}

extension ListCharacterRouter: TargetType {
    
    var baseURL: URL {
        switch self {
        case .findCharacterBy, .detailLocation:
            return URL(string: Constants.URL.base)!
        }
        
    }
    
    var path: String {
        switch self {
        case .findCharacterBy:
            return Constants.Path.character
        case .detailLocation(let locationID):
            return Constants.Path.location + "/" +  locationID
        }
        
    }
    
    var method: Method {
        switch self {
        case .findCharacterBy, .detailLocation:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .findCharacterBy(let param, _ ):
            if param == "Bet" {
                return Constants.SampleData.findCharacterByNameBet.data(using: String.Encoding.utf8)!
            }
            return Constants.SampleData.getAllCharacter.data(using: String.Encoding.utf8)!
        case .detailLocation:
            return Constants.SampleData.detailLocationWithIDTwenty.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .findCharacterBy(let characterName, let page):
            let parameters = [ Constants.Parameter.name : characterName,
                               Constants.Parameter.page : page ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .detailLocation:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
}

//
//  ListCharacterViewModel.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Silva on 2022-12-11.
//  Copyright © 2022 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

class ListCharacterViewModel {
    
    private var repository: RxListCharacterRepository
    private var listOfCharacterViewData = [CharacterViewData]()
    private var totalOfPages = 1
    private var totalOfItems = 0
    
    
    init(repository: RxListCharacterRepository) {
        self.repository = repository
    }
    
    func loadCharacters() {
        
        self.repository.
        
    }
    
    func transform(input: RxListCharacterViewModelInput) -> RxListCharacterViewModelOutput {
        
        let activityIndicator = ActivityIndicator()
        let isRefreshing = activityIndicator.asDriver()
        
        var listOfCharacter = Driver<[CharacterViewData]>.empty()
        
        let cleanUpRequest = Driver.combineLatest(input.searchString.debounce(0.6), input.triggerAllCharacters.asDriver(onErrorJustReturn: 0), input.reloadSearch.asDriver(onErrorDriveWith: .empty()))
        
        listOfCharacter = cleanUpRequest.flatMapLatest { searchTerm, currentPage, isReloadSearch -> Driver<[CharacterViewData]> in
            var page = currentPage
            var searchString = searchTerm
            if !searchString.isEmpty {
                page = 1
                self.totalOfPages = 1
                self.listOfCharacterViewData.removeAll()
            }
            if isReloadSearch {
                self.listOfCharacterViewData.removeAll()
                searchString = ""
                page = 1
            }
            
//            if currentPage > self.totalOfPages {
//                return Driver<[CharacterViewData]>.just(self.listOfCharacterViewData)
//            } else {
//                page = currentPage
//            }
            
            return self.repository.filterCharcter(by: searchString, in: "\(page)")
                .retry(30)
                .trackActivity(activityIndicator)
                .map({ (characterResult) in
                    self.totalOfPages = characterResult.info.pages
                    self.totalOfItems.onNext(characterResult.info.count)
                    self.listOfCharacterViewData.append(contentsOf:
                        characterResult.results
                            .map { character in
                                CharacterViewData(
                                    name: character.name,
                                    image: character.image,
                                    gender: character.gender,
                                    numberOfEpisodes: character.episode.count,
                                    locationID: self.getLocationId(from: character.location.url)
                                )
                    })
                    return self.listOfCharacterViewData
                }).asDriver(onErrorJustReturn: [CharacterViewData]())
        }.asDriver(onErrorJustReturn: [CharacterViewData]())
        
        let shouldStopRefresh = isRefreshing
            .filter {
                !$0
        }
        
        return RxListCharacterViewModelOutput(
            listOfCharacter: listOfCharacter,
            totalOfItems: totalOfItems.asDriver(onErrorJustReturn: 0),
            shouldStopRefresh: shouldStopRefresh
        )
    }
    
    private func getLocationId(from url: String) -> String {
        var suffix = url.suffix(2).lowercased()
        if suffix.contains("/") {
            suffix.removeFirst()
            return suffix
        }
        return suffix
    }
    
}

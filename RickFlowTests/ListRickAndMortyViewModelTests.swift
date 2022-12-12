//
//  ListRickAndMortyViewModelTests.swift
//  ListRickAndMortyViewModelTests
//
//  Created by Hoff Henry Pereira da Silva on 10/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//  Identify Unit test cases related with Feature 3 and implement at least one.

import XCTest
import Moya
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import RickFlow

class ListRickAndMortyViewModelTests: XCTestCase {
    
    var viewmodel: RxListCharacterViewModel!
    var repository: RxListCharacterRepository!
    var service: RxListCharacterService!
    var provider: MoyaProvider<ListCharacterRouter>!
    var bag = DisposeBag()
    
    override func setUp() {
        self.provider = MoyaProvider<ListCharacterRouter>(stubClosure: MoyaProvider.immediatelyStub)
        self.service = RxListCharacterServiceImpl(provider: self.provider)
        self.repository = RxListCharacterRepositoryImpl(service: self.service)
        self.viewmodel = RxListCharacterViewModel(repository: self.repository)
    }

    override func tearDown() {

    }

    func testGetAllCharacterPageOne() {
        
        let testScheduler = TestScheduler(initialClock: 0)
        
        let trigger = testScheduler.createHotObservable([next(100, 1)]).asSignal(onErrorJustReturn: 1)
        let searchString = testScheduler.createHotObservable([next(100, "")]).asDriver(onErrorDriveWith: .empty())
        let input = RxListCharacterViewModelInput(triggerAllCharacters: trigger, searchString: searchString)
        
        let output = viewmodel.transform(input: input)
        
        let observer = testScheduler.createObserver([CharacterViewData].self)
        output.listOfCharacter.drive(observer).disposed(by: bag)
        
        testScheduler.start()
        
        let characters = [
            CharacterViewData(name: "Rick Sanchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male", numberOfEpisodes: 31, locationID: "20"),
            CharacterViewData(name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: "Male", numberOfEpisodes: 31, locationID: "20")
            ]
        
        let expectedEvents =  next(100, characters)
        
        XCTAssertEqual(observer.events.first!, expectedEvents)
    }
    
    func testFilterCharacterByNameBet() {
        let testScheduler = TestScheduler(initialClock: 0)
        
        let trigger = testScheduler.createHotObservable([next(100, 1)]).asSignal(onErrorJustReturn: 1)
        let searchString = testScheduler.createHotObservable([next(100, "Bet")]).asDriver(onErrorDriveWith: .empty())
        let input = RxListCharacterViewModelInput(triggerAllCharacters: trigger, searchString: searchString)
        
        let output = viewmodel.transform(input: input)
        
        let observer = testScheduler.createObserver([CharacterViewData].self)
        output.listOfCharacter.drive(observer).disposed(by: bag)
        
        testScheduler.start()
        
        let characters = [CharacterViewData(
                            name: "Beth Smith",
                            image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
                            gender: "Female",
                            numberOfEpisodes: 24,
                            locationID: "20")
                          ]
        
        let expectedEvents =  next(100, characters)
        
        XCTAssertEqual(observer.events.first!, expectedEvents)
    }

}

//
//  DetailRickAndMoryCharecterViewModel.swift
//  RickFlowTests
//
//  Created by Hoff Henry Pereira da Silva on 11/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import XCTest
import Moya
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import RickFlow

class DetailRickAndMoryCharecterViewModel: XCTestCase {
    

    var viewmodel: DetailRickAndMortyCharcterViewModel!
    var repository: RxListCharacterRepository!
    var service: RxListCharacterService!
    var provider: MoyaProvider<ListCharacterRouter>!
    var bag = DisposeBag()
    
    override func setUp() {
        self.provider = MoyaProvider<ListCharacterRouter>(stubClosure: MoyaProvider.immediatelyStub)
        self.service = RxListCharacterServiceImpl(provider: self.provider)
        self.repository = RxListCharacterRepositoryImpl(service: self.service)
        self.viewmodel = DetailRickAndMortyCharcterViewModel(repository: self.repository)
    }

    func testNameOfLocationTwenty() {
        let testScheduler = TestScheduler(initialClock: 0)
        
        let trigger = testScheduler.createHotObservable([next(100, "20")]).asDriver(onErrorDriveWith: .empty())
        let input = DetailRickAndMortyCharcterViewModelInput(trigger: trigger)
        
        let output = viewmodel.transform(input: input)
        
        let observer = testScheduler.createObserver(String.self)
        
        output.locationName.drive(observer).disposed(by: bag)
        
        testScheduler.start()
        
        XCTAssertEqual(observer.events, [next(100, "Earth (Replacement Dimension)")])
    
    }
    
    func testTypeOfLocationTwenty() {
        let testScheduler = TestScheduler(initialClock: 0)
        
        let trigger = testScheduler.createHotObservable([next(100, "20")]).asDriver(onErrorDriveWith: .empty())
        let input = DetailRickAndMortyCharcterViewModelInput(trigger: trigger)
        
        let output = viewmodel.transform(input: input)
        
        let observer = testScheduler.createObserver(String.self)
        
        output.locationType.drive(observer).disposed(by: bag)
        
        testScheduler.start()
        
        XCTAssertEqual(observer.events, [next(100, "Planet")])
    
    }

}

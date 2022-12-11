//
//  DetailOfRickAndMortyCharacterView.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 09/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class DetailOfRickAndMortyCharacterView: UITableViewController, Storyboarded {
    
    @IBOutlet weak var cahracterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterNumberOfEpisodes: UILabel!
    @IBOutlet weak var characterLocantionName: UILabel!
    @IBOutlet weak var characterLocationType: UILabel!
    
    var character: CharacterViewData!
    var viewmodel: RxDetailRickAndMortyCharcterViewModel!
    
    private var trigger = PublishSubject<String>()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewData()
    }
    
    private func setViewData() {
        let url = URL(string: character.image)
        self.cahracterImageView.kf.setImage(with: url)
        self.characterNameLabel.text = character.name
        self.characterGenderLabel.text = character.gender
        self.characterNumberOfEpisodes.text = "\(character.numberOfEpisodes)"
        self.setupBindings(using: character.locationID)
    }
    
    private func setupBindings(using locationID: String) {
        
        let input = RxDetailRickAndMortyCharcterViewModelInput(
            trigger: self.trigger.startWith(locationID).asDriver(onErrorDriveWith: .empty())
        )
        
        let output = self.viewmodel.transform(input: input)
        
        output.locationName.drive(self.characterLocantionName.rx.text).disposed(by: bag)
        
        output.locationType.drive(self.characterLocationType.rx.text).disposed(by: bag)
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

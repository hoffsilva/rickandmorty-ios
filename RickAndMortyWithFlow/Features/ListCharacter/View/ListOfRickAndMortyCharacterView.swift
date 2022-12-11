//
//  ListOfRickAndMortyCharacterView.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 06/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxSwiftUtilities

class ListOfRickAndMortyCharacterView: UICollectionViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator!

    private var bag = DisposeBag()
    private var numberOfItems: Int!
    private var totalOfItems: Int!
    private var page = 1
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let gesture = UIGestureRecognizer(target: self, action: #selector(goToTop))
    let trigger = BehaviorSubject<Int>(value: 1)
    let reloadSearch = PublishSubject<Bool>()
    let stackErrorView = UIStackView(frame: UIScreen.main.bounds)
    let backgroundIamgeView = UIImageView(image: #imageLiteral(resourceName: "error_view"))
    let retryButton = UIButton()
    
    var viewModel: RxListCharacterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pleaseWaiting()
        self.title = "Rick and Morty Character"
        self.collectionView.delegate = nil
        self.collectionView.dataSource = nil
        self.configureErrorView()
        self.configureCellLayout()
        self.configureSearchBar()
        self.setupBindings()
    }
    
    private func setupBindings() {
        
        let input = RxListCharacterViewModelInput(
            triggerAllCharacters: trigger.asSignal(onErrorJustReturn: 1),
            searchString: self.searchController.searchBar.rx.text.orEmpty.distinctUntilChanged().asDriver(onErrorJustReturn: ""),
            reloadSearch: self.reloadSearch.startWith(false).asDriver(onErrorDriveWith: .empty())
        )
        
        let output = self.viewModel.transform(input: input)
    
        output.listOfCharacter.drive(
            self.collectionView.rx.items(cellIdentifier: "RickAndMortyCharacterCell", cellType: RickAndMortyCharacterCell.self)) { (_, characterViewData, cell) in
                    cell.configureCell(with: characterViewData)
            }.disposed(by: bag)
        
        output.listOfCharacter.drive(onNext: { [weak self] listOfCharacterViewData in
            self?.numberOfItems = listOfCharacterViewData.count
        }).disposed(by: bag)
        
        output.listOfCharacter.drive(onNext: { [weak self] listOfCharacterViewData in
            self?.stackErrorView.isHidden = !listOfCharacterViewData.isEmpty
        }).disposed(by: bag)
        
        self.retryButton.rx.tap.subscribe { [weak self] _ in
            self?.searchController.searchBar.text = ""
            self?.reloadSearch.onNext(true)
            self?.reloadSearch.onNext(false)
        }.disposed(by: bag)
        
        output.totalOfItems.drive(onNext: { [weak self] totalOfItems in
            self?.totalOfItems = totalOfItems
        }).disposed(by: bag)
        
        self.collectionView.rx.willDisplayCell.subscribe(onNext: { [weak self] (cellInformation) in
            guard let self = self else { return }
            if cellInformation.at.row == self.numberOfItems - 2 && self.totalOfItems != self.numberOfItems {
                self.page += 1
                self.trigger.onNext(self.page)
                self.pleaseWaiting()
            }
        }).disposed(by: bag)
        
        self.collectionView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            let characterCell = self?.collectionView.cellForItem(at: indexPath) as! RickAndMortyCharacterCell
            guard let character = characterCell.character else { return }
            self?.coordinator.detailRickAndMortyCharacter(character)
        }).disposed(by: bag)
        
        output.shouldStopRefresh.drive(onNext: { [weak self] _ in
            self?.removeActivityIndicator()
        }).disposed(by: bag)
        
    }
    
    private func configureCellLayout() {
        let sideSize = (view.frame.size.width - 40) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: sideSize, height: sideSize)
    }
    
    private func configureSearchBar() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.clearButtonMode = UITextField.ViewMode.never
        searchController.searchBar.placeholder = "Search character..."
        searchController.searchBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        searchController.searchBar.barStyle = UIBarStyle.default
        if #available(iOS 13.0, *) {
            searchController.automaticallyShowsCancelButton = true
        }
        searchController.searchBar.returnKeyType = .done
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.addGestureRecognizer(gesture)
    }
    
    @objc private func goToTop() {
        self.collectionView.setContentOffset(.zero, animated: true)
    }
    
    private func configureErrorView() {
        
        stackErrorView.alignment = .center
        stackErrorView.axis = .vertical
        
        let stackAlignmetView = UIStackView()
        stackAlignmetView.axis = .horizontal
        stackAlignmetView.alignment = .center
    
        stackErrorView.addArrangedSubview(stackAlignmetView)
        self.backgroundIamgeView.addSubview(retryButton)
        self.retryButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.retryButton.topAnchor.constraint(equalToSystemSpacingBelow: retryButton.superview!.topAnchor, multiplier: 0).isActive = true
        self.retryButton.bottomAnchor.constraint(equalToSystemSpacingBelow: retryButton.superview!.bottomAnchor, multiplier: 0).isActive = true
        self.retryButton.trailingAnchor.constraint(equalToSystemSpacingAfter: retryButton.superview!.trailingAnchor, multiplier: 0).isActive = true
        self.retryButton.leadingAnchor.constraint(equalToSystemSpacingAfter: retryButton.superview!.leadingAnchor, multiplier: 0).isActive = true
        
        stackAlignmetView.addArrangedSubview(backgroundIamgeView)
        
        stackErrorView.isHidden = true
        
        self.searchController.view.addSubview(stackErrorView)
        
    }
    
}

extension ListOfRickAndMortyCharacterView: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.reloadSearch.onNext(true)
        self.reloadSearch.onNext(false)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.reloadSearch.onNext(false)
        return true
    }
    
}

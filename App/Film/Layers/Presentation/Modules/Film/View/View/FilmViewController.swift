//
//  FilmViewController.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UI
import UIKit
import SnapKit

final class FilmViewController: BaseViewController {
    
    // MARK: - Public Properties
    
    public var output: FilmViewOutput?
    
    // MARK: - UI
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FilmCollectionViewLayout())
    
    private let cellProvider = FilmCollectionViewCellProvider()
    
    private lazy var dataSource = FilmCollectionViewDataSource(
        collectionView: collectionView,
        cellProvider: { [weak self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            self?.cellProvider.cell(collectionView, at: indexPath, using: item)
        }
    )
    
    // MARK: - Overriden
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didRequestFilm()
    }
    
    // MARK: - Configure
    
    override func addViews() {
        view.addSubview(collectionView)
    }
    
    override func configureViews() {
        configureCollectionView()
    }
    
    override func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    private func configureCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.register(CollectionViewCell<FilmPosterView>.self)
        collectionView.register(CollectionViewCell<UILabel>.self)
    }
    
    private func configureViewAppearance() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureCollectionViewAppearance() {
        collectionView.backgroundColor = .systemBackground
    }
}

// MARK: - FilmViewInput

extension FilmViewController: FilmViewInput {
    func didReceiveFilm(film: FilmViewModel) {
        applySnapshot(using: film, animatingDifferences: false)
    }
    
    func didReceiveRandomFilm(film: FilmViewModel) {
        applySnapshot(using: film, animatingDifferences: true)
    }
}

// MARK: - Private

extension FilmViewController {
    private func applySnapshot(using film: FilmViewModel, animatingDifferences: Bool) {
        var snapshot = FilmCollectionViewSnapshot()
        
        snapshot.appendSections([.main])
        
        let items: [FilmItem] = [
            .poster(
                FilmPosterConfiguration(
                    posterConfiguration: ImageConfiguration(url: film.poster),
                    voteConfiguration: FilmVoteConfiguration(text: film.voteAverage)
                )
            ),
            .title(.filmTitle(text: film.title)),
            .subtitle(.filmSubtitle(text: film.subtitle)),
            .description(.filmDescription(text: film.description))
        ]
        
        snapshot.appendItems(items)
        
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

//
//  FilmPosterView.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UI
import UIKit
import NukeUI

final class FilmPosterView: BaseView {
    
    // MARK: - ReusableView
    
    static let reuseIdentifier = "FilmPosterView"
    
    // MARK: - UI
    
    private let imageView = LazyImageView()
    private let voteView = FilmVoteView()
    
    // MARK: - Public Properties
    
    var configuration: FilmPosterConfiguration = FilmPosterConfiguration() {
        didSet {
            guard oldValue != configuration else {
                return
            }
            
            updateConfiguration()
        }
    }
    
    // MARK: - Overriden
    
    override func addViews() {
        addSubviews(imageView, voteView)
    }
    
    override func configureConstraints() {
        configureImageViewConstraints()
        configureVoteViewConstraints()
    }
    
    override func configureAppearance() {
        imageView.backgroundColor = .systemGroupedBackground
        imageView.layer.cornerCurve = .continuous
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    override func updateConfiguration() {
        imageView.source = ImageRequest(url: configuration.posterConfiguration.source.url)
        voteView.configuration = configuration.voteConfiguration
    }
    
    // MARK: - Configure
    
    private func configureImageViewConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.centerX.bottom.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(330)
        }
    }
    
    private func configureVoteViewConstraints() {
        voteView.snp.makeConstraints { make in
            make.centerX.equalTo(imageView)
            make.bottom.equalTo(imageView).offset(-8)
        }
    }
}

// MARK: - ReusableView

extension FilmPosterView: ReusableView {
    func prepareForReuse() {
        configuration = FilmPosterConfiguration()
    }
}

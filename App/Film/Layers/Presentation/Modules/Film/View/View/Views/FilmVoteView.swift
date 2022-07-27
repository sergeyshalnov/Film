//
//  FilmVoteView.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UI
import UIKit

final class FilmVoteView: BaseView {
    
    // MARK: - UI
    
    private let titleLabel = UILabel()
    
    // MARK: - Public Properties
    
    var configuration: FilmVoteConfiguration = FilmVoteConfiguration(text: .empty) {
        didSet {
            guard oldValue != configuration else {
                return
            }
            
            updateConfiguration()
        }
    }
    
    // MARK: - Overriden
    
    override func addViews() {
        addSubview(titleLabel)
    }
    
    override func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(horizontal: 20, vertical: 4))
        }
    }
    
    override func configureAppearance() {
        layer.cornerCurve = .continuous
    }
    
    override func updateConfiguration() {
        titleLabel.configure(with: configuration.title)
        backgroundColor = configuration.backgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}

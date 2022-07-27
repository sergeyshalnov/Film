//
//  ErrorViewModel.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

struct AlertViewModel {
    
    // MARK: - Public Properties
    
    let title: String
    let message: String?
    let actions: [AlertActionViewModel]
    
    // MARK: - Init
    
    init(
        title: String,
        message: String?,
        actions: [AlertActionViewModel]
    ) {
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    init(
        title: String,
        message: String?,
        action: AlertActionViewModel
    ) {
        self.title = title
        self.message = message
        self.actions = [action]
    }
}

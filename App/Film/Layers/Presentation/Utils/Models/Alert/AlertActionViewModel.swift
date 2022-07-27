//
//  AlertActionViewModel.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

struct AlertActionViewModel {
    let title: String
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
}

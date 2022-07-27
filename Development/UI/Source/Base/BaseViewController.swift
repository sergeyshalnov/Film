//
//  BaseViewController.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit.UIViewController

open class BaseViewController: UIViewController {
    
    // MARK: - Overriden
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureViews()
        configureConstraints()
        configureAppearance()
    }
    
    // MARK: - Open
    
    open func addViews() { }
    open func configureViews() { }
    open func configureConstraints() { }
    open func configureAppearance() { }
}

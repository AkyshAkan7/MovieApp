//
//  MovieDescriptionViewController.swift
//  MovieApp
//
//  Created by Akan Akysh on 4/3/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import UIKit

class MovieDescriptionViewController: UIViewController {
    
    let viewModel: MovieDescriptionViewModel

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    init(viewModel: MovieDescriptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

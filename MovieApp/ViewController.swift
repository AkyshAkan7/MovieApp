//
//  ViewController.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/7/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.getTopRatedMovies { movies in
            print(movies)
        }
    }


}


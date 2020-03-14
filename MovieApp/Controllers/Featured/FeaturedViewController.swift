//
//  ViewController.swift
//  MovieApp
//
//  Created by Akan Akysh on 3/7/20.
//  Copyright © 2020 Akysh Akan. All rights reserved.
//

import UIKit
import SnapKit

class TopRatedViewController: UIViewController {
    
    enum Constants {
        enum Title {
            static let topRated = "Top Rated"
            static let popular = "Popular"
            static let upcoming = "Upcoming"
            static let nowPlaying = "Now playing"
        }
    }
    
    private let viewModel = TopRatedViewModel()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigation()
        makeUI()
        parseData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "SectionCell")
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "CollectionViewCell")
        tableView.separatorStyle = .none
    }
    
    func parseData() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            NetworkManager.getNowPlayingMovies(page: 1) { [weak self] movies in
                guard let self = self else { return }
                self.viewModel.listItems.append(SectionItem(label: Constants.Title.nowPlaying))
                self.viewModel.listItems.append(MovieItem(movies: movies))
                self.tableView.reloadData()
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
            
            dispatchGroup.enter()
            NetworkManager.getTopRatedMovies(page: 1) { [weak self] movies in
                guard let self = self else { return }
                self.viewModel.listItems.append(SectionItem(label: Constants.Title.topRated))
                self.viewModel.listItems.append(MovieItem(movies: movies))
                self.tableView.reloadData()
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
            
            dispatchGroup.enter()
            NetworkManager.getPopularMovies(page: 1) { [weak self] movies in
                guard let self = self else { return }
                self.viewModel.listItems.append(SectionItem(label: Constants.Title.popular))
                self.viewModel.listItems.append(MovieItem(movies: movies))
                self.tableView.reloadData()
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
            
            dispatchGroup.enter()
            NetworkManager.getUpcomingMovies(page: 1) { [weak self] movies in
                guard let self = self else { return }
                self.viewModel.listItems.append(SectionItem(label: Constants.Title.upcoming))
                self.viewModel.listItems.append(MovieItem(movies: movies))
                self.tableView.reloadData()
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
        }
    }
    
    // objc methods
    @objc func buttonTapped(_ sender: UIButton) {
        
        let movieVC = MoviesViewController()
        navigationController?.pushViewController(movieVC, animated: true)
    }
    
}


// MARK: - UI
private extension TopRatedViewController {
    func setupNavigation() {
        navigationItem.title = "Featured"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func makeUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - table view delegate
extension TopRatedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.listItems[indexPath.row]
        
        switch item.itemType {
        case .section:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
            cell.configure(item: item as! SectionItem)
            cell.nextButton.tag = indexPath.row
            cell.nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return cell
        case .movies:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell", for: indexPath) as! MoviesTableViewCell
            cell.configure(item: item as! MovieItem)
            return cell
        }
        
    }
    
}


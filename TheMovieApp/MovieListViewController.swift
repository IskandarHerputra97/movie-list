//
//  MovieListViewController.swift
//  TheMovieApp
//
//  Created by Iskandar Herputra Wahidiyat on 21/05/21.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    private var cellViewModel: [MovieListTableViewCellViewModel] = []
    
    private var i = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchMovieList()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Movie List"
        tableview.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListTableViewCell")
    }
    
    //MARK: - Private
    private func fetchMovieList() {
        var cellViewModel: [MovieListTableViewCellViewModel] = []
        for _ in 1...5 {
            let viewModel: MovieListTableViewCellViewModel = MovieListTableViewCellViewModel(name: "Movie Name \(i)")
            cellViewModel.append(viewModel)
            i += 1
        }
        self.cellViewModel.append(contentsOf: cellViewModel)
        
        if self.cellViewModel.count > 0 {
            self.tableview.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < cellViewModel.count, let cell: MovieListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        let viewModel: MovieListTableViewCellViewModel = cellViewModel[indexPath.row]
        
        cell.setupContent(content: viewModel)
        
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

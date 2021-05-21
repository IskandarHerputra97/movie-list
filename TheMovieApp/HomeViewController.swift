//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Iskandar Herputra Wahidiyat on 20/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!

    private var cellViewModel: [MovieGenreTableViewCellViewModel] = []
    
    private var i = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchGenreList()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Movie App"
        tableview.register(UINib(nibName: "MovieGenreTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieGenreTableViewCell")
    }
    
    //MARK: - Private
    private func fetchGenreList() {
        var cellViewModel: [MovieGenreTableViewCellViewModel] = []
        for _ in 1...5 {
            let viewModel: MovieGenreTableViewCellViewModel = MovieGenreTableViewCellViewModel(genre: "Genre Name \(i)")
            cellViewModel.append(viewModel)
            i += 1
        }
        self.cellViewModel.append(contentsOf: cellViewModel)
        
        if self.cellViewModel.count > 0 {
            self.tableview.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < cellViewModel.count, let cell: MovieGenreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieGenreTableViewCell") as? MovieGenreTableViewCell else {
            return UITableViewCell()
        }
        
        let viewModel: MovieGenreTableViewCellViewModel = cellViewModel[indexPath.row]
        
        cell.setupContent(content: viewModel)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieListVC: MovieListViewController = MovieListViewController()
        navigationController?.pushViewController(movieListVC, animated: true)
    }
}

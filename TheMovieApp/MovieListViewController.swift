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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Movie List"
    }
}

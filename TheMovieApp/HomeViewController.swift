//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Iskandar Herputra Wahidiyat on 20/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Setup
    private func setupView() {
        title = "Movie App"
    }
}

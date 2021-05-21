//
//  MovieListTableViewCell.swift
//  TheMovieApp
//
//  Created by Iskandar Herputra Wahidiyat on 21/05/21.
//

import UIKit

final class MovieListTableViewCellViewModel {
    private(set) var name: String = ""
    
    init(name: String?) {
        if let name: String = name {
            self.name = name
        }
    }
}

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupContent(content: MovieListTableViewCellViewModel) {
        movieNameLabel.text = content.name
    }
}

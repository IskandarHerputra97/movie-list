//
//  MovieGenreTableViewCell.swift
//  TheMovieApp
//
//  Created by Iskandar Herputra Wahidiyat on 21/05/21.
//

import UIKit

final class MovieGenreTableViewCellViewModel {
    private(set) var genre: String = ""
    
    init(genre: String?) {
        if let genre: String = genre {
            self.genre = genre
        }
    }
}

class MovieGenreTableViewCell: UITableViewCell {
    @IBOutlet weak var genreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupContent(content: MovieGenreTableViewCellViewModel) {
        genreLabel.text = content.genre
    }
}

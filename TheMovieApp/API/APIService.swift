//
//  APIService.swift
//  TheMovieApp
//
//  Created by Iskandar Herputra Wahidiyat on 21/05/21.
//

import Foundation

class APIService {
    static var movies = [Movie]()
    static var movieCount = 0
    
    static func getMovieData(completion: @escaping () -> Void) {
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key=0561fb61ccd13b5dea762e58b20f90e3&language=en-US"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print("error message: \(error.localizedDescription)")
            }
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Movie.self, from: data)
                self.movies.append(result)
                self.movieCount = result.genres.count
                DispatchQueue.main.async {
                    completion()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}

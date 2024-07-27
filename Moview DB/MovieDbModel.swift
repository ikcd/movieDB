//
//  MovieDbModel.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import Foundation



struct MovieDbModel: Codable {
    var Title: String?
    var Year: String?
    var Rated: String?
    var Released: String?
    var Runtime: String?
    var Genre: String?
    var Director: String?
    var Writer: String?
    var Actors: String?
    var Plot: String?
    var Language: String?
    var Country: String?
    var Awards: String?
    var Poster: String?
    var Ratings: [Rating?]
    var Metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var DVD: String?
    var BoxOffice: String?
    var Production: String?
    var Website: String?
    var Response: String?
}

struct Rating: Codable {
    var Source: String?
    var Value: String?
}



struct MovieCardModel: Codable {
    var imageUrl: String
    var title: String
    var language: String
    var year: String
}

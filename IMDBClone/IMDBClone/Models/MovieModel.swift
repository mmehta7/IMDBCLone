//
//  MovieModel.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import Foundation

struct IMDBData: Codable {
    let Movies: [Movie]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case Movies = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Movie: Codable, Identifiable {
    var id =  UUID()
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}

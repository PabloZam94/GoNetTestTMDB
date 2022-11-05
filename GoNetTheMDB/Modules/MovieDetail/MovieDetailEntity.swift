//
//  MovieDetailEntity.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import Foundation

struct MovieDetailResponse: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: BelongsToCollection?
    var budget: Int?
    var genres: [Genres]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var revenue: Int?
    var runtime: Double?
    var spoken_languages: [SpokenLeguages]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
}

struct BelongsToCollection: Codable {
    var id: Int?
    var name: String?
    var poster_path: String?
    var backdrop_path: String?
}

struct Genres: Codable {
    var id: Int?
    var name: String?
}

struct SpokenLeguages: Codable {
    var english_name: String?
    var iso_639_1: String?
    var name: String?
}

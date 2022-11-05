//
//  HomeEntity.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import Foundation

struct MoviesGenericResponse: Codable{
   // var dates: Dates?
    var page: Int?
    var results: [Results]?
    var totalPages: Int?
    var totalResults: Int?
}

struct Results: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}



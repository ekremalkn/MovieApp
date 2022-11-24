//
//  MovieMoreDetail.swift
//  BestMovieApp
//
//  Created by Ekrem Alkan on 24.11.2022.
//

import Foundation

// MARK: - MovieMoreDetail
struct MovieMoreDetail: Codable {
    let id: Int?
    let results: DetailMovie?
}

// MARK: - DetailMovie
struct DetailMovie: Codable {
    let ca, kr: CA?
    let mx: MX?
    let us: CA?

    enum CodingKeys: String, CodingKey {
        case ca = "CA"
        case kr = "KR"
        case mx = "MX"
        case us = "US"
    }
}

// MARK: - CA
struct CA: Codable {
    var link: String?
    let buy, rent: [Buy]?
}

// MARK: - Buy
struct Buy: Codable {
    let logoPath: String?
    let providerID: Int?
    let providerName: String?
    let displayPriority: Int?

    enum CodingKeys: String, CodingKey {
        case logoPath = "logo_path"
        case providerID = "provider_id"
        case providerName = "provider_name"
        case displayPriority = "display_priority"
    }
}

// MARK: - MX
struct MX: Codable {
    let link: String?
    let buy: [Buy]?
}

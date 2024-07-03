//
//  MovieInfoResponseModel.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 5/10/24.
//

import Foundation

// MARK: - DailyBoxOffice

struct DailyBoxOffice: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult

struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList

struct DailyBoxOfficeList: Codable {
    let rank, title, audienceNumber: String
    
    enum CodingKeys: String, CodingKey {
        case rank
        case title = "movieNm"
        case audienceNumber = "audiAcc"
    }
}

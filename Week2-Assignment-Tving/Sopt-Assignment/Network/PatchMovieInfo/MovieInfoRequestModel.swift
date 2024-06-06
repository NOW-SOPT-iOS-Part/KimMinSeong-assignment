//
//  MovieInfoRequestModel.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 5/10/24.
//

import Foundation

struct MovieInfoRequestModel: Codable {
    let key: String
    let targetDt: String /// 조회하고자 하는 날짜를 의미 형식: yyyymmdd
}

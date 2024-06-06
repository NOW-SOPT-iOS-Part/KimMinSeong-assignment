//
//  MovieInfoResponseModel.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 5/10/24.
//

import Foundation

struct MovieInfoResponseModel: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let code: Int /// 응답 코드
    let rank: String /// 해당 일자의 박스오피스 순위를 의미
    let movieNm: String /// 영화명(국문)을 의미
    let salesAcc: String /// 누적 매출액을 의미
    let audiAcc: String /// 누적 관객수를 의미
}

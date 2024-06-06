//
//  AddTargetType.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 5/10/24.
//

import Foundation

import Moya

enum MovieTargetType {
    case getMovieInfo(request: MovieInfoRequestModel)
}

extension MovieTargetType: TargetType {
    
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    // 이거 .json 붙여야 하는지 아닌지 모르겠음... headers에서 json이라고 알려줬으니 안붙여도 되는거 아닌감...
    // 만약에 이거 안되면 build setting에서 BASE_URL 잘못 입력한거임...(/searchWeeklyBoxOfficeList 지원서 입력했기 때문에)
    var path: String {
        switch self {
        case.getMovieInfo:
            return "/searchWeeklyBoxOfficeList"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovieInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMovieInfo(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"] // Content-Type이 JSON이다~ 라는 의미
    }
    
    
}


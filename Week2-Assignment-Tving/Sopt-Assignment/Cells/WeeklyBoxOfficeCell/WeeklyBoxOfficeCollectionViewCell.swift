//
//  WeeklyBoxOfficeCollectionViewCell.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 5/10/24.
//

import UIKit

import SnapKit
import Then

class WeeklyBoxOfficeCollectionViewCell: UICollectionViewCell {
    
    // MARK: Property
    
    private let identifier = WeeklyBoxOfficeCollectionViewCell.className
    
    // MARK: UIComponents
    
    let rankLabel = UILabel().then {
        $0.text = "영화 랭킹"
        $0.textAlignment = .left
    }
    let movieNameLabel = UILabel().then {
        $0.text = "영화 랭킹"
        $0.textAlignment = .left
    }
    let salesAccLabel = UILabel().then {
        $0.text = "영화 랭킹"
        $0.textAlignment = .left
    }
    let audienceAccLabel = UILabel().then {
        $0.text = "영화 랭킹"
        $0.textAlignment = .left
    }
    
    private lazy var movieInfoStack = UIStackView(arrangedSubviews: [rankLabel, movieNameLabel, salesAccLabel, audienceAccLabel]).then {
        $0.axis = .vertical
        $0.spacing = 8
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        requestMovieInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
}

// MARK: Extensions
extension WeeklyBoxOfficeCollectionViewCell {
    
    func setHierarchy() {
        addSubviews(
            rankLabel,
            movieNameLabel,
            salesAccLabel,
            audienceAccLabel,
            movieInfoStack
        )
    }
    
    private func requestMovieInfo() {
        MovieService.shared.getMovieInfo(request: MovieInfoRequestModel) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieInfoResponseModel else {
                    return }
                self?.rankLabel.text = data.data.rank
                self?.movieNameLabel.text = data.data.movieNm
                self?.salesAccLabel.text = data.data.salesAcc
                self?.audienceAccLabel.text = data.data.audiAcc
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("안녕")
            case .serverErr:
                print("서버 ")
            case .networkFail:
                print("네트워크 ")
            }
        }
    }
    
    func setLayout() {
        

    }
}

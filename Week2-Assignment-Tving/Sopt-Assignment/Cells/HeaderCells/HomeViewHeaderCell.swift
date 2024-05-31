//
//  HomeViewHeaderCell.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class HomeViewHeaderCell: UICollectionReusableView {
    
    // MARK: UIComponents
    
    private let titleLabel = UILabel().then {
        $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
        // 폰트 pretendardFont weight: 600, size: 11
        $0.textColor = .white
    }
    
    private let viewAllLabel = UILabel().then {
        $0.text = "전체보기 >"
        // 폰트
        $0.textColor = .white
    }
    
    // MARK: Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Extensions
extension HomeViewHeaderCell {
    func setStyle() {
        backgroundColor = .clear
    }
    
    func setHierarchy() {
        self.addSubviews(
            titleLabel,
            viewAllLabel
        )
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
        viewAllLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
    }
    
}
// MARK: extensions
extension HomeViewHeaderCell {
    func bindTitle(title: String = "기본 내용" ) {
        self.titleLabel.text = title
    }
}

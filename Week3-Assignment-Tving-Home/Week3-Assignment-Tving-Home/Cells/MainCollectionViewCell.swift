//
//  MainCollectionViewCell.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit
import Then
import SnapKit

// 너의 이름은 영화 포스터 있는 부분 셀
class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: Property
    
    // MARK: UIComponents
    private let mainCellImageView = UIImageView().then {
        $0.image = UIImage(resource: .mainImage1)
    }
    
    private let imageTitle = UILabel().then {
        $0.text = "제목"
//        $0.font = .pretendardFont(weight: 700, size: 25)
        $0.textColor = .white
        $0.textAlignment = .left
    }
        
    private let imageInfo = UILabel().then {
        $0.text = "상세내용"
//        $0.font = .pretendardFont(weight: 500, size: 14)
        $0.textColor = .white
        $0.textAlignment = .left
    }
        
    private lazy var VStackView = UIStackView(arrangedSubviews: [imageTitle,imageInfo]).then {
        $0.axis = .vertical
        $0.spacing = 12
    }
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
}

// MARK: Extensions
extension MainCollectionViewCell {
    func setHierarchy() {
        addSubview(mainCellImageView)
        mainCellImageView.addSubviews(VStackView)
    }
    
    func setLayout() {
        mainCellImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        VStackView.snp.makeConstraints {
            $0.leading.equalTo(mainCellImageView.snp.leading).offset(16)
            $0.bottom.equalTo(mainCellImageView.snp.bottom).inset(28)
        }

    }
    
    func bindData(image: UIImage, title: String = "기본", info: String = "기본 내용") {
        self.mainCellImageView.image = image
        self.imageTitle.text = title
        self.imageInfo.text = info
    }
}


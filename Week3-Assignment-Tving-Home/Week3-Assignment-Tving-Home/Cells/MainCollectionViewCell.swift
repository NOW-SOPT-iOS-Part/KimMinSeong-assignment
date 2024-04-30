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
    
    // MARK: UIComponents
    
    private let mainCellImageView = UIImageView().then {
        $0.image = UIImage(resource: .mainImage1)
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

private extension MainCollectionViewCell {
    func setHierarchy() {
        addSubview(mainCellImageView)
    }
    
    func setLayout() {
        mainCellImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}


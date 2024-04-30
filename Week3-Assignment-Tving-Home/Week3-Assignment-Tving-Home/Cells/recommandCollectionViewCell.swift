//
//  recommandCollectionViewCell.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit
import Then
import SnapKit

class recommandCollectionViewCell: UICollectionViewCell {
    
    // MARK: Property
    
    // MARK: UIComponents
    private let imageView = UIImageView().then {
        $0.image = UIImage(resource: .image1)
    }
    
    private let imageTitle = UILabel().then {
        $0.text = "시그널"
        $0.textAlignment = .left
        $0.textColor = .white
    }
    
    private lazy var vstackView = UIStackView(arrangedSubviews: [imageView, imageTitle]).then {
        $0.axis = .vertical
        $0.spacing = 3
        
    }
    
    // MARK: Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        addSubviews(vstackView)
    }
    
    private func setLayout() {
        vstackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(583)
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(146 + 3 + 17)
        }
        
        imageView.snp.makeConstraints {
            $0.height.equalTo(146)
        }
        
        imageTitle.snp.makeConstraints {
            $0.height.equalTo(17)
        }


    }
    
    func bindData(image: UIImage) {
            self.imageView.image = image
        }
    
    
}

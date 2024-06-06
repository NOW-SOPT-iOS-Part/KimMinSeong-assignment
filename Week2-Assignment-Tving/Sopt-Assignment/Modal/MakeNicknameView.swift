//
//  MakeNicknameView.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 6/4/24.
//

import UIKit

import Then
import SnapKit

class MakeNicknameView: UIView {
    
    // MARK: - UIComponents
    
    let titleLabel = UILabel()
    let nicknameTextfield = UITextField()
    lazy var saveButton = UIButton()
    
    // MARK: - Life Cycles
    
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

// MARK: - Extensions

extension MakeNicknameView {
    func setStyle() {
        titleLabel.do {
            $0.text = "닉네임을 입력해주세요."
            $0.textAlignment = .left
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
}

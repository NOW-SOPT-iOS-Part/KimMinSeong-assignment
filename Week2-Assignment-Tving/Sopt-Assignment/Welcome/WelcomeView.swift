//
//  WelcomeView.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 6/7/24.
//

import UIKit

import SnapKit
import Then

final class WelcomeView: UIView {
    
    // MARK: - UIComponents
    
    let welcomeImage = UIImageView()
    let welcomeMessage = UILabel()
    lazy var backToMainButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension WelcomeView {
    func setUI() {
        welcomeImage.do {
            $0.image = UIImage(named: "Welcome_Image")
        }
        
        welcomeMessage.do {
            $0.text = "_______@_____.com 님 \n 반가워요! "
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
            $0.textColor = UIColor(resource: .labelGrey)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        backToMainButton.do {
            $0.backgroundColor = UIColor(resource: .brandRed)
            $0.setTitle("메인으로", for: .normal)
            $0.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.setTitleColor(UIColor(.white), for: .normal)
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            
        }
    }
    
    func setHierarchy() {
        addSubviews(welcomeImage, welcomeMessage, backToMainButton)
    }
    
    func setLayout() {
        welcomeImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.width.equalTo(390)
            $0.height.equalTo(210.94)
        }
        
        welcomeMessage.snp.makeConstraints {
            $0.top.equalTo(welcomeImage.snp.bottom).offset(67.06)
            $0.leading.equalToSuperview().offset(66)
            $0.width.equalTo(244)
            $0.height.equalTo(74)
        }
        
        backToMainButton.snp.makeConstraints {
            $0.top.equalTo(welcomeMessage.snp.bottom).offset(284)
            $0.leading.equalToSuperview().offset(27.5)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
}


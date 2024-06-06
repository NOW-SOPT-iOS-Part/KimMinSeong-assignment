//
//  LogoView.swift
//  Week3-Assignment-Tving-Home
//
//  Created by 김민성 on 4/30/24.
//

import UIKit
import Then
import SnapKit

final class LogoView: UIView {
    
    // MARK: UIComponents
    
    private let tvingLogo = UIImageView()
    private let userProfile = UIImageView()
    private lazy var HStackView = UIStackView(arrangedSubviews: [tvingLogo, userProfile])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = .clear
        
        tvingLogo.do {
            $0.image = UIImage(resource: .logo)
        }
        
        userProfile.do {
            $0.image = UIImage(resource: .userProfile)
            $0.layer.cornerRadius = 16.5
            $0.clipsToBounds = true
        }
        
        HStackView.do {
            $0.axis = .horizontal
            $0.spacing = 245
            $0.alignment = .center
        }
    }
    
    func setHierarchy() {
        addSubviews(
            HStackView
        )
    }
    
    func setLayout() {
        HStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.height.equalTo(94)
        }
        
        tvingLogo.snp.makeConstraints {
            $0.width.equalTo(94)
            $0.height.equalTo(25)
        }
        
        userProfile.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(33)
            
        }



    }
}

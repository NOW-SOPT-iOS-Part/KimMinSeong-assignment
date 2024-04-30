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
    
    private let tvingLogo = UIImageView().then {
        $0.image = UIImage(resource: .logo)
    }
    
    private let userProfile = UIImageView().then {
        $0.image = UIImage(resource: .userProfile)
    }
    
    private lazy var HStackView = UIStackView(arrangedSubviews: [tvingLogo, userProfile]).then {
        $0.axis = .horizontal
        $0.spacing = 223
    }
    
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
    }
    
    func setHierarchy() {
        addSubviews(
            HStackView
        )
    }
    
    func setLayout() {
        HStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(11)
        }

    }
}

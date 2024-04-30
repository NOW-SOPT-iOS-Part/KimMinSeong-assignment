//
//  WelcomeViewController.swift
//  Week2-Assignment-Tving
//
//  Created by 김민성 on 4/13/24.
//

import Foundation
import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    var email: String?
    
    private let welcomeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Welcome_Image")
        return image
    }()
    
    private let welcomeMessage: UILabel = {
        let label = UILabel()
        label.text = "_______@_____.com 님 \n 반가워요! "
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        label.textColor = UIColor(resource: .labelGrey)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var backToMainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(resource: .brandRed)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(.white), for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)

        return button
    }()
    
    private func bindEmail() {
        guard let emailText = email else { return }
        self.welcomeMessage.text = "\(emailText)님 \n반가워요!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        [welcomeImage, welcomeMessage, backToMainButton].forEach {
            self.view.addSubview($0)
            
        bindEmail()
        }
        self.navigationController?.isNavigationBarHidden = true // 네비게이션 바를 비활성화하는 코드 뷰의 생명 주기상 뷰가 띄우는 함수 안에 넣어야할 것 같아서 여기에 넣음.
        
        // iPhone 13 pro 기준 (390x844)
        // button leading value is 27.5px
        
        // Tving 이미지 위치
        welcomeImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.width.equalTo(390)
            $0.height.equalTo(210.94)
        }
        
        // 환영 인사 메시지 위치
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
    
    @objc private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

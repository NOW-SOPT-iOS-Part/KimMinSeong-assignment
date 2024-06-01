//
//  LoginView.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 6/1/24.
//

import UIKit

import Then
import SnapKit

class LoginView: UIView {
    
    // MARK: - Properties
    
    var buttonIsActive: Bool? = nil
    var secureButtonIsActive: Bool? = nil
    
    // MARK: - UIComponents
    
    private let titleLabel = UILabel()
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    lazy var loginButton = UIButton()
    lazy var findIDButton = UIButton()
    var verticalBar = UILabel()
    lazy var findPasswordButton = UIButton()
    let accountLabel = UILabel()
    lazy var makeNicknameButton = UIButton()
    lazy var secureButton = UIButton()
    lazy var deleteButton = UIButton()
    
    // MARK: - View Life Cycles
    
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

extension LoginView {
    func setStyle() {
        self.backgroundColor = .black
        
        titleLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = UIColor(resource: .labelGrey)
            $0.textAlignment =  .center
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.setPlaceholder(color: .gray2)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
            $0.addPadding(left: 22)
            $0.backgroundColor = UIColor(resource: .gray3)
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.setPlaceholder(color: .gray2)
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
            $0.addPadding(left: 22)
            $0.backgroundColor = UIColor(resource: .gray3) // 버튼 위치 안보여서 한 단계 컬러 낮춤.
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
            $0.isSecureTextEntry = true
        }
        
        loginButton.do {
            $0.backgroundColor = UIColor(red: 0/255, green: 0/225, blue: 0/225, alpha: 1)
            $0.setTitle("로그인하기", for: .normal)
            $0.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.setTitleColor(UIColor(resource: .gray2), for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray4.cgColor
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 3
        }
        
        findIDButton.do {
            $0.backgroundColor = UIColor(.black)
            $0.setTitle("아이디 찾기", for: .normal)
            $0.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.setTitleColor(UIColor(resource: .gray2), for: .normal)
        }
        
        verticalBar.do {
            $0.text = "|"
            $0.textColor = UIColor(resource: .gray4)
            $0.textAlignment = .center
        }
        
        findPasswordButton.do {
            $0.backgroundColor = UIColor(.black)
            $0.setTitle("비밀번호 찾기", for:.normal)
            $0.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.setTitleColor(UIColor(resource: .gray2), for: .normal)
        }
        
        accountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.font = UIFont(name: "Pretendard-Medium", size: 14)
            $0.textColor = UIColor(resource: .gray3)
            $0.textAlignment = .center
        }
        
        makeNicknameButton.do {
            $0.backgroundColor = UIColor(.black)
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.underlineTitle(forTitle: "닉네임 만들러가기")
            $0.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.setTitleColor(UIColor(resource: .gray2), for: .normal)
        }
        
        secureButton.do {
            $0.setImage(UIImage(named: "Eye_Slash_Icon"), for: .normal)
            secureButtonIsActive = false
        }
        
        deleteButton.do {
            $0.setImage(UIImage(named: "Delete_Icon"), for: .normal)
        }
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(112.5)
            $0.height.equalTo(37)
            $0.width.equalTo(165)
        }
        
        // idTextField's position
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(158)
            $0.leading.equalToSuperview().offset(27.5)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        // passwordTextField's position
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(27.5)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        // loginButton's position
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(27.5)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        // findIDButton's position
        findIDButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(70)
//            $0.trailing.equalTo(findPasswordButton.snp.leading).offset(69)
            $0.width.equalTo(64)
            $0.height.equalTo(22)
        }
        
        // verticalBar's position
        verticalBar.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(180)
            $0.width.equalTo(12)
        }
        
        // findPassword's position
        findPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(86)
//            $0.trailing.equalTo(findPasswordButton.snp.leading).offset(69)
            $0.width.equalTo(76)
            $0.height.equalTo(22)
        }
        
        // accountLabel's position
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(findIDButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(220)
            $0.width.equalTo(137)
            $0.height.equalTo(22)
        }
        
        // makeNicknameButton's position
        makeNicknameButton.snp.makeConstraints {
            $0.top.equalTo(findPasswordButton.snp.bottom).offset(28)
            $0.leading.equalTo(accountLabel.snp.trailing).offset(43)
            $0.width.equalTo(128)
            $0.height.equalTo(22)
        }
        
        secureButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).offset(18)
            $0.leading.equalTo(passwordTextField.snp.leading).offset(295)
            $0.width.height.equalTo(20)
            
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top).inset(18)
            $0.leading.equalTo(passwordTextField.snp.leading).offset(259)
            $0.width.height.equalTo(20)
        }
    }
    
    func setHierarchy() {
        [titleLabel, idTextField, passwordTextField, loginButton, findIDButton, verticalBar, findPasswordButton, accountLabel, makeNicknameButton, deleteButton, secureButton].forEach {
            self.addSubview($0)
        }
    }
    
    
}

extension UIButton {
 
    func underlineTitle(forTitle: String) {
        guard let buttonTitle = self.titleLabel?.text else { return }
        
        let rangeToUnderLine = (buttonTitle as NSString).range(of: forTitle)
        
        let underLineTitle = NSMutableAttributedString(string: buttonTitle)
        underLineTitle.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        
        self.setAttributedTitle(underLineTitle, for: .normal)
    }
}



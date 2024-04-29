//
//  LoginViewController.swift
//  Week2-Assignment-Tving
//
//  Created by 김민성 on 4/11/24.
//

/*
 2024.04.17 기준 구현해야할 기능 및 보완
 secureButton layout 다시 잡아야함 근데 rightView로 되어 있어서 어케하는지 모르겠음.
 deleteButton 기능 구현하기
 */

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private var buttonIsActive: Bool? = nil
    private var secureButtonIsActive: Bool? = nil
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = UIColor(resource: .labelGrey)
        label.textAlignment =  .center
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.setPlaceholder(color: .gray2)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.addPadding(left: 22)
        textField.backgroundColor = UIColor(resource: .gray3)
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.setPlaceholder(color: .gray2)
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.addPadding(left: 22)
        textField.backgroundColor = UIColor(resource: .gray3) // 버튼 위치 안보여서 한 단계 컬러 낮춤.
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0/255, green: 0/225, blue: 0/225, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(resource: .gray2), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var findIDButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(.black)
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(resource: .gray2), for: .normal)
        return button
    }()
    
    private var verticalBar: UILabel = {
        let verticalBar = UILabel()
        verticalBar.text = "|"
        verticalBar.textColor = UIColor(resource: .gray4)
        verticalBar.textAlignment = .center
        return verticalBar
    }()
    
    private lazy var findPasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(.black)
        button.setTitle("비밀번호 찾기", for:.normal)
        button.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(resource: .gray2), for: .normal)
        return button
    }()
    
    private let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(resource: .gray3)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var makeNicknameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(.black)
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.underlineTitle(forTitle: "닉네임 만들러가기")
        button.titleLabel?.font =  UIFont(name: "Pretendard-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(resource: .gray2), for: .normal)
        return button
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Eye_Slash_Icon"), for: .normal)
        button.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
        secureButtonIsActive = false
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Delete_Icon"), for: .normal)
        button.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // page layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func checkFont() {
            for family in UIFont.familyNames {
                print("🍏",family)
                for name in UIFont.fontNames(forFamilyName: family) {
                    print(name)
                }
            }
        }
        checkFont()
        
        self.view.backgroundColor = .black
        [titleLabel, idTextField, passwordTextField, loginButton, findIDButton, verticalBar, findPasswordButton, accountLabel, makeNicknameButton, deleteButton, secureButton].forEach {
            self.view.addSubview($0)
        }
        
        // iPhone 13 pro 기준 (390x844)
        // button leading value is 27.5px
        
        // titleLabel's position
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


        
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc func deleteButtonDidTap() {
        deleteButtonIsOn()
    }
    
    private func deleteButtonIsOn() {
        passwordTextField.text = ""
    }
    
    @objc func securityButtonDidTap() {
        passwordTextField.isSecureTextEntry.toggle()
        secureButtonIsActive!.toggle()
        
        switch secureButtonIsActive! {
        case true:
            secureButton.setImage(UIImage(named: "Eye_Icon"), for: .normal)
            
        case false:
            secureButton.setImage(UIImage(named: "Eye_Slash_Icon"), for: .normal)
        }
        
        print("security")
        
    }
    
    @objc func loginButtonDidTap() {
        if buttonIsActive == true  {
            pushToWelcomeVC()
        }
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.email = idTextField.text
        self.navigationController?
            .pushViewController(welcomeViewController, animated: true)
    }
}

extension LoginViewController {
    
    // 유저가 textField에서 editing을 시작할 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray2.cgColor
    }
    
    func loginButtonIsOn(isOn: Bool) {
        switch isOn {
            case true:
            buttonIsActive = true
            loginButton.isUserInteractionEnabled = true
            loginButton.backgroundColor = UIColor(resource: .brandRed)
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.layer.borderWidth = 0
            
            case false:
            buttonIsActive = false
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = .black
            loginButton.setTitleColor(UIColor(resource: .gray2), for: .normal)
            loginButton.layer.borderWidth = 1
        }
    }
    
    // 유저가 textField에서 editing을 끝냈을 때
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if idTextField.hasText && passwordTextField.hasText {
            loginButtonIsOn(isOn: true)
        } else {
            loginButtonIsOn(isOn: false)
        }
    }
    
}

extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}

// Text Field에 패딩 주기
extension UITextField {
    
    /// 텍스트필드 안쪽에 패딩 추가
    /// - Parameter left: 왼쪽에 추가할 패딩 너비
    /// - Parameter right: 오른쪽에 추가할 패딩 너비
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}

// UIButton에 underline 추가하기
extension UIButton {
 
    func underlineTitle(forTitle: String) {
        guard let buttonTitle = self.titleLabel?.text else { return }
        
        let rangeToUnderLine = (buttonTitle as NSString).range(of: forTitle)
        
        let underLineTitle = NSMutableAttributedString(string: buttonTitle)
        underLineTitle.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        
        self.setAttributedTitle(underLineTitle, for: .normal)
    }
}

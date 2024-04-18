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

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private var buttonIsActive: Bool? = nil
    private var deleteButtonIsActive: Bool? = nil
    
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
//        textField.rightViewMode = .always
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
//        var idConditon = idTextFieldCondition()
//        var passwordCondition = passwordTextFieldCondition()
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
    
    // rightView로 설정해놨더니 layout이 갑자기 이상한대로 감...
    // UITextField가 FirstResponder라서 textField는 자기안에서 발생하는 모든 이벤트의 Responder가 되기 때문에 버튼을 탭해도 이벤트가 전해지지 않음... -> UITextField의 rightView 속성을 이용해서 해결
    private lazy var secureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Eye_Slash_Icon"), for: .normal)
        button.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
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
        
//        [deleteButton, secureButton].forEach {
//            self.passwordTextField.addSubview($0)
//        }
        
        
        
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
    
    // 비밀번호 보안 버튼 활성화 및 비활성화 기능 구현
    @objc func securityButtonDidTap() {
//        secureButtonIsOn()
        passwordTextField.isSecureTextEntry.toggle()
        print("security")
    }
    
//    private func secureButtonIsOn() {
        
//        switch passwordTextField.isSecureTextEntry {
//        case true:
//            passwordTextField.isSecureTextEntry = false
//        
//        case false:
//            passwordTextField.isSecureTextEntry = true
//    
//        }
//    }
    
    // 로그인 버튼 tap시 WelcomeViewController로 navigate하는 기능 구현
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
        
        /* switch statement로 변경한게 가독성이 훨 좋음
        if isOn == true {
         loginButton.isUserInteractionEnabled = true
         loginButton.backgroundColor = UIColor(resource: .brandRed)
         loginButton.layer.borderWidth = 0
        } else {
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = .black
            loginButton.layer.borderWidth = 1
        }
        */
    }
    
    // 유저가 textField에서 editing을 끝냈을 때
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // 두 개의 textField가 비어있지 않다면 버튼을 활성화 시키고 boder를 0으로 만들어줌.
        if idTextField.hasText && passwordTextField.hasText {
            loginButtonIsOn(isOn: true)
        } else {
            loginButtonIsOn(isOn: false)
        }
    }
    
    // clear button
    /*
     textField Delegate 패턴에는 내용을 삭제할 때 호출되는 textFieldShouldClear(_ textField: UITextField)가 있다. 일단 이걸 이용하면 될 것 같은데...
     아니면 textFieldShouldBeginEditing() 안에서 구현이 되어야 할 것 같기도 함. 이때, passwordTextField가 비어있지만 않으면 버튼을 이용할 수 있는 것이니까.
     
     근데 버튼의 기능은 또 어디에서 구현하지...? 이는 버튼과 관련된 메소드를 이용하면 될 듯.(2024.04.16)
     
     secureButton 구현해보니까 똑같이 하면 될 것 같기도 하고(2024.04.17)
     */
}

/* textField 정규식 만족되면 버튼 색 변경
extension LoginViewController {
    // idTextField에 입력된 내용이 이메일 형식이면 return true
    func idTextFieldCondition(_ tf: UITextField,_ cv: UIView,_ errorLabel: UILabel,_ regex: String) {
        
    }
    
    // 비밀번호가 9자리 넘으면 return true
    func passwordTextFieldCondition() {
        let pwRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 영어 + 숫자 + 특수문자
    }
    
//    func textFieldDidChangeSelection(idCondition: Bool, passwordCondition: Bool) {
//        if idCondition && passwordCondition {
//            loginButton.backgroundColor = UIColor(resource: .brandRed)
//        }
//    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == idTextField {
            // id 유효성 검사
        } else if textField == passwordTextField {
            // password 유효성 검사
        }
        
    }
}
*/

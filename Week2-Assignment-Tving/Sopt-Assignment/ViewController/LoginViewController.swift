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

import UIKit

import Then
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties

    
    // MARK: - UIComponents
    
    private var rootView = LoginView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.secureButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
        rootView.deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        setDelegate()
    }
    
    @objc func loginButtonDidTap() {
        if rootView.buttonIsActive == true  {
            pushToWelcomeVC()
        }
    }
    
    @objc func deleteButtonDidTap() {
        deleteButtonIsOn()
    }
    
    private func deleteButtonIsOn() {
        rootView.passwordTextField.text = ""
    }
    
    @objc func securityButtonDidTap() {
        rootView.passwordTextField.isSecureTextEntry.toggle()
        rootView.secureButtonIsActive!.toggle()
        
        switch rootView.secureButtonIsActive! {
        case true:
            rootView.secureButton.setImage(UIImage(named: "Eye_Icon"), for: .normal)
            
        case false:
            rootView.secureButton.setImage(UIImage(named: "Eye_Slash_Icon"), for: .normal)
        }
        
        print("security")
        
    }
    
    func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.email = rootView.idTextField.text
        self.navigationController?
            .pushViewController(welcomeViewController, animated: true)
    }
}

// MARK: - Extensions

extension LoginViewController {
    func setDelegate() {
        rootView.idTextField.delegate = self
        rootView.passwordTextField.delegate = self
    }
    
    // 유저가 textField에서 editing을 시작할 때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray2.cgColor
    }
    
    func loginButtonIsOn(isOn: Bool) {
        switch isOn {
            case true:
            rootView.buttonIsActive = true
            rootView.loginButton.isUserInteractionEnabled = true
            rootView.loginButton.backgroundColor = UIColor(resource: .brandRed)
            rootView.loginButton.setTitleColor(.white, for: .normal)
            rootView.loginButton.layer.borderWidth = 0
            
            case false:
            rootView.buttonIsActive = false
            rootView.loginButton.isUserInteractionEnabled = false
            rootView.loginButton.backgroundColor = .black
            rootView.loginButton.setTitleColor(UIColor(resource: .gray2), for: .normal)
            rootView.loginButton.layer.borderWidth = 1
        }
    }
    
    // 유저가 textField에서 editing을 끝냈을 때
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if rootView.idTextField.hasText && rootView.passwordTextField.hasText {
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

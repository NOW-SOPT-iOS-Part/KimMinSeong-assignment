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
    private var viewModel = LoginViewModel()
    private let modalViewController = MakeNicknameModalViewController()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieService.shared.getMovieInfo(request: MovieInfoRequestModel.init(key: "f5eef3421c602c6cb7ea224104795888", targetDt: "12e1e212")) { result in
            switch result {
            case .success(let data):
                print(data)
                
            default:
                break
            }
        }
        
        setTarget()
        setDelegate()
        bindViewModel()
    }
}

// MARK: - Extensions

extension LoginViewController {
    func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.secureButton.addTarget(self, action: #selector(securityButtonDidTap), for: .touchUpInside)
        rootView.deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        rootView.makeNicknameButton.addTarget(self, action: #selector(makeNickNameButtonDidTap), for: .touchUpInside)
    }
    
    func bindViewModel() {
        viewModel.isValid = { [weak self] flag in
            if flag {
                self?.pushToWelcomeVC()
            }
        }
        
        viewModel.errMessage = { [weak self] err in
            if let err = err {
                self?.showToast(err)
            }
        }
    }
    
    func showToast(_ err: String) {
        print(err)
    }
    
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
    
    // 유저가 textField에서 editing을 끝냈을 때
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if rootView.idTextField.hasText && rootView.passwordTextField.hasText {
            loginButtonIsOn(isOn: true)
        } else {
            loginButtonIsOn(isOn: false)
        }
    }
    
    @objc func loginButtonDidTap() {
        if rootView.buttonIsActive == true  {
            viewModel.checkValid(
                id: rootView.idTextField.text,
                password: rootView.passwordTextField.text
            )
        }
        
        
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
    
    @objc private func makeNickNameButtonDidTap() {
        if let sheet = modalViewController.sheetPresentationController {
                sheet.detents = [.medium()]
        }
        
        self.present(modalViewController, animated: true)
    }
    
    func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.email = rootView.idTextField.text
        self.navigationController?
            .pushViewController(welcomeViewController, animated: true)
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


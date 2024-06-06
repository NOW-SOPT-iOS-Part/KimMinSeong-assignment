//
//  WelcomeViewController.swift
//  Week2-Assignment-Tving
//
//  Created by 김민성 on 4/13/24.
//

import UIKit

import SnapKit
import Then

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var email: String?
    
    // MARK: - UIComponents
    
    var rootView = WelcomeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .black
        self.navigationController?.isNavigationBarHidden = true
        rootView.backToMainButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        
        bindEmail()
    }
}

// MARK: - Extensions

extension WelcomeViewController {
    
    private func bindEmail() {
        guard let emailText = email else { return }
        rootView.welcomeMessage.text = "\(emailText)님 \n반가워요!"
    }
    
    @objc private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

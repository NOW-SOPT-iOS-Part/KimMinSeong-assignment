//
//  LoginViewModel.swift
//  SOPT-Assignment-Tving
//
//  Created by 김민성 on 6/7/24.
//

import UIKit

final class LoginViewModel {
    var isValid: ((Bool) -> Void)?
    var errMessage: ((String?) -> Void)?
    
    func checkValid(id: String?, password: String?) {
        guard let id = id, !id.isEmpty else {
            errMessage?("아이디가 비어있습니다.")
            return
        }
        guard let password = password, !password.isEmpty else {
            errMessage?("비밀번호가 비어있습니다.")
            return
        }
        
        let idRegEx = "[A-Za-z0-9]{5,13}"
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        
        if id.range(of: idRegEx, options: .regularExpression) == nil {
            errMessage?("아이디가 유효하지 않습니다.")
            return
        }
        
        if password.range(of: pwRegEx, options: .regularExpression) == nil {
            errMessage?("비밀번호가 유효하지 않습니다.")
            return
        }
        
        isValid?(true)
    }
}

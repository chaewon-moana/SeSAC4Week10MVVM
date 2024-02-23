//
//  LoginViewModel.swift
//  SeSAC4Week10MVVM
//
//  Created by cho on 2/23/24.
//

import Foundation

class LoginViewModel {

    var inputEmail = Observable("")
    var inputPassword = Observable("")
    
    var outputValidation = Observable("")
    var outputValidColor = Observable(false)
    init() {
        print("viewModel init")
        inputEmail.bind { value in
            print("email validation")
            self.validation(email: value, pw: self.inputPassword.value)
        }
        
        inputPassword.bind { value in
            print("password validation")
            self.validation(email: self.inputEmail.value, pw: value)
        }
    }
    
    private func validation(email: String, pw: String) {
        if email.count >= 3 && pw.count > 5 {
            outputValidation.value = email
            outputValidColor.value = true
            //color true값 (green)
        } else {
            outputValidation.value = "이메일은 3글자, 비밀번호는 5자리 이상"
            outputValidColor.value = false
            //color false값 (red)
        }
    }
}

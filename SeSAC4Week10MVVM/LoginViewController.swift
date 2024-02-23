//
//  LoginViewController.swift
//  SeSAC4Week10MVVM
//
//  Created by cho on 2/23/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var pwField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    let viewModel = LoginViewModel() //얘 자체가 init이 되어서 viewmodel의 init rnansdl 실행이 됨
    
//    var emailText = Observable("")
//    var emailText = "a@b.com" {
//        didSet {
//            resultLabel.text = emailText
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputValidColor.bind { value in
            self.resultLabel.textColor = value ? .green : .red
        }
        viewModel.outputValidation.bind { value in //바뀔때마다 누구랑 싱크맞춰줄까?
            print("=====")
            self.resultLabel.text = value
           // self.pwField.text = value
        }
        //emailField.text = emailText.value
        //resultLabel.text = emailText.value
        //pwField.text = passwordText
        
        emailField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        pwField.addTarget(self, action: #selector(pwChanged), for: .editingChanged)
    }
    
    @objc func emailChanged() {
        guard let text = emailField.text else { return }
        viewModel.inputEmail.value = text
        
        
        //resultLabel.text = emailText.value
    }
    
    @objc func pwChanged() {
        guard let text = pwField.text else { return }
        viewModel.inputPassword.value = text
    }

}

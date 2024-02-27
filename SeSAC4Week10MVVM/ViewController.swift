//
//  ViewController.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    
    let viewModel = NumberViewModel()
    
//    func welcome() {
//        print("테스트중입니다")
//    }
    
//    let welcome = { //이렇게 함수를 만들어줄 수 있음
//        print("테스트중입니다")
//    }
    
    func hello(name: String) {
        print("sdfsdf")
    }
//    let a = { nick in
//        print("저는 \(nick)입니다")
//    }
    
    func welcome(nickname: String) {
        print("저는 \(nickname)입니다")
    }
    
    func welcome(name: String) {
        print("저는 \(name)입니다")
    }
    
//    let a = { (name: String) in
//        print("저는 \(name)입니다")
//    }
    
    let a: (String) -> Void = { name in //요렇게 쓰면 name이 어떤 타입인지 말하지 않아도 됨
        print("저는 \(name)입니다")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        var a = welcome //이렇게 함수를 나눌 수도 있음
//        a("모아나")//왜 nickname을 생략해도 되는가?
        
        let food = Food("pizza")
        
        //이름 없는 함수이기에 welcome을 선언하지 않고 그대로 고대로 넣어도 문제가 없음!
        food.test(welcome(name:)) //같은 이름의 함수가 있기때문에 혼돈에 빠짐,,,오버로딩된 함수가 많다면,,함수를 더 구체적으로 이야기해주는 것 -> welcome(name:) 요런식으루
        food.test(hello) //hello는 하나밖에 없기때문에 이렇게 써도 괜춘
        //food.test(welcome) //함수 타입에 일치하는 함수 넣기
//        food.test { //소괄호를 원래 써야하지만 안써도 괜찮도록 축약형태를 제공,, closure 축약 형태 소괄호 생략
//            print("변경된 값은 \(food.name)")
       // } //인스턴스를 만들자마자 실행하게 할 수 있음..그리고 굳이 외부에서 실행하지 않아도 ㅇㅋㅇㅋ
       // print(food.name)
//        food.closure = {
//            print("closure 테스트 중이라고 해도 되나,,?") //굳이 let으로 선언해서 만들지 않고, 이렇게 만들어줘도 됨!
//        }

//        food.test({
//            print("테스트 중입니다")
//        })
        food.name = "hamburger" //didSet nil
        //autoclosure

        
        //food.closure = welcome
 
        food.name = "chicken" //didSet print
        //food.closure?()
        print(food.name)

        
//        let a = Observable("2")
//        let b = Observable("3")
        
//        a.closure = {
//            print(a.text + b.text)
//        }
        //위와 아래가 같음
//        a.bind {
//            print(a.text + b.text)
//        }
//        
//        a.text = "7"
//        a.text = "5"
        
        viewModel.outputResult.bind { value in
            self.resultLabel.text = value
            //print(value)
        }
        
       
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    
    @objc
    func numberTextFieldChanged() {
        //3000 -> 3,000
        //텍스트필드에 사용자가 입력한 데이터를 뷰모델로 전달
        viewModel.inputText.value = numberTextField.text!
        
    }


}


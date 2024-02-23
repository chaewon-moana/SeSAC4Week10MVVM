//
//  User.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import Foundation
//model
struct User {
    let name: String
    let age: Int
}

//get set 연산 -> 중괄호 들어있으면 일단 연산 프로퍼티로 생각하고 있음
//didSet, willSet 프로퍼티 옵저버
//didSet은 원래 값을 가지고 있고 바뀔 때 실행되지, 초기화될땐 바뀌지 않음
class Food {
    
    private var closure: ((String) -> Void)?//클로저인데 왜 옵셔널?
    
    var name: String {  //인스턴스 프로퍼티
        didSet { //초기화 시에는 실행되지 않음
            //print("name changed") //값을 가지고 있기에 저장프로퍼티,,,중괄호있는데 연산 프로퍼티가 아닌가,
            //get 이나 set을 불렀으면 연산 프로퍼티가 되었을 것!
            print("didSet")
            closure?(name) //nil이면 실행되면 안되기에 옵셔널 체이닝,,
        }
    }
    
    init(_ name: String) { //하나밖에 없다면 매개변수를 생략해도 괜찮음
        self.name = name
    }
    
    func test(_ example: @escaping (String) -> Void) { //test가 bind으로 바뀌고 name이 textfh qkRNlrp ehlsms rjt@
        print(#function)
        example(name)
        closure = example
    }
}

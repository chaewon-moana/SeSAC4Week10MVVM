//
//  UserViewModel.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import Foundation
//비즈니스 로직만 담당하기 때문에 import UIKit X
class UserViewModel {
    
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 22),
        User(name: "Den", age: 22),
    ]

    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
    
    func appendUser(name: String?) {
        //중복은 안됨!
        guard let name = name else { return }
        
        //뷰모델에서 중복여부 확인, 옵셔널 처리, User, append 다 처리하고 있음
        for item in list {
            if item.name == name {
                return
            }
        }
       
        //요런식으로 표현할수도 있음
        let age = Int.random(in: 1...100)
        let user = User(name: name, age: age)
        list.append(user)
    }
    
}

//
//  UserViewModel.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import Foundation
//비즈니스 로직만 담당하기 때문에 import UIKit X
class UserViewModel {

    //비즈니스 로직은 최대한 이 안에 있도록 만들 수 있음
    var list: Observable<[User]> = Observable([])
    //서치버튼 클릭시
    var inputSearchWord: Observable<String?> = Observable(nil)
    //추가버튼 클릭시
    var inputAddText: Observable<String?> = Observable(nil)
    //로드버튼 클릭시
    var inputFetchButtonClicked: Observable<Void?> = Observable(nil) //받을 수 있는 공간을 만들어두고, 값이 변경이 된다면은 새로 fetchUser가 실행되도록 만듦!
    //삭제버튼 클릭시
    var inputRemoveButtonClicked: Observable<Void?> = Observable(nil)
    
    
    //뷰컨에서 해주기 싫고, 뷰모델에서만 해주고 싶다! 그러면 init 구문에서 처리해줄수도 있음
    init() {
        transform()
    }
    
    private func transform() {
        fetchUser()
        inputFetchButtonClicked.bind { _ in
            self.fetchUser()
        }
        inputRemoveButtonClicked.bind { _ in
            self.list.value.removeAll()
        }
        inputAddText.bind { text in
            self.appendUser(name: text)
        }
        inputSearchWord.bind { text in
            guard let text = text else { return }
            let result = self.list.value.filter { $0.name.contains(text) }
            self.list.value = result
        }
    }
    var numberOfRowsInSection: Int {
        return list.value.count //list는 단순히 클래스,,,
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> User {
        return list.value[indexPath.row]
    }
    
    private func fetchUser() {
        list.value = [
            User(name: "Hue", age: 23),
            User(name: "Jack", age: 21),
            User(name: "Bran", age: 22),
            User(name: "Den", age: 22)
        ]
    }
    
    private func appendUser(name: String?) {
        //중복은 안됨!
        guard let name = name else { return }
        
        //뷰모델에서 중복여부 확인, 옵셔널 처리, User, append 다 처리하고 있음
        for item in list.value {
            if item.name == name {
                return
            }
        }
       
        //요런식으로 표현할수도 있음
        let age = Int.random(in: 1...100)
        let user = User(name: name, age: age)
        list.value.append(user)
    }
    
}

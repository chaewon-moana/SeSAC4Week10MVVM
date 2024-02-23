//
//  Observable.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import Foundation
//실시간으로 달라지는 데이터를 감지
class Observable<T> {
    
    private var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        self.closure = closure
    }
}

class ObservableBool { //이렇게 Bool 도 처리할 수 있지만,,제네릭으로 처리할 수 이씅
    
    private var closure: ((Bool) -> Void)?
    
    var value: Bool {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: Bool) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (Bool) -> Void) {
        print(#function)
        closure(value)
        self.closure = closure
    }
}

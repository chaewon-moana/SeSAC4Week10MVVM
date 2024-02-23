//
//  NumberViewModel.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import Foundation

class NumberViewModel {
    
    //텍스트필드에 사용자가 입력하는 값
    var inputText = Observable("")

    var outputResult = Observable("9")
    
    init() {
        self.inputText.bind { value in
            self.validation(value)
        }
    }
    
    //inputText에서 받은 데이터 가공
    private func validation(_ text: String) {
        
        //1. 빈값
        if text.isEmpty {
            outputResult.value = "값을 입력해주세요"
        }
        
        //2. 문자열
        guard let num = Int(text) else {
            outputResult.value =  "숫자만 입력해주세요"
            return
        }
        
        //3. 숫자 쉼표.
        if num > 0, num <= 1000000 {
            let format = NumberFormatter()
            format.numberStyle = .decimal
            let result = format.string(for: num)
            outputResult.value =  result!
        } else {
            outputResult.value =  "100만원 이하로 입력해주세요."
        }
        
    }
    
}

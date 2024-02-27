//
//  NetworkViewModel.swift
//  SeSAC4Week10MVVM
//
//  Created by cho on 2/26/24.
//

import Foundation
import Alamofire
//List와 네트워크 통신을 하는 것은 뷰모델로 오는게 맞음!
//그럼 네트워크 통신은 viewdidLoad에서 실행하는데 그 시점을 뷰모델이 어케 아느냐!
//init 시점에 동작할 수 있도록 해줄 수 있음
class NetworkViewModel {
    //viewDidLoad 시점이야! 라고 알려주는 변수
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    var outputLabelData = Observable("")
    var outputMarketData: Observable<[Market]> = Observable([])
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest() //어느시점에 실행을 할지 명시적으로 표현해주는 것!
        }
    }
    
    private func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                self.outputMarketData.value = success
                self.outputLabelData.value = success[0].korean_name
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

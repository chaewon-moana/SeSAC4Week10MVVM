//
//  APiService.swift
//  SeSAC4Week10MVVM
//
//  Created by cho on 2/27/24.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    private init() { }
    
    func fetchUUpbitMarketAPI(completionHandler: @escaping ([Market]) -> Void) {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

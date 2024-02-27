//
//  NetworkViewController.swift
//  SeSAC4Week10MVVM
//
//  Created by cho on 2/26/24.
//

import UIKit
//UIKit import를 제거했을 때, 오류가 안뜬다면 viewModel이 가지고 있어도 됨!
//List와 네트워크 통신을 하는 것은 뷰모델로 오는게 맞음!
class NetworkViewController: UITableViewController {

    @IBOutlet var tempLabel: UILabel!
    
    let viewModel = NetworkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //network request -> response codable -> list -> reloadData
        //callRequest()
        //nil -> () -> () //값 전체가 달라지는 여부에 대해서만 따져보면 됨. ex 검색어 같은거 검색해도 똑같이 검색되는 것 처럼
        viewModel.inputViewDidLoadTrigger.value = ()
        bindData()
    }
    
    func bindData() {
        viewModel.outputMarketData.bind { _ in
            self.tableView.reloadData()
        }
        viewModel.outputLabelData.bind { value in
            self.tempLabel.text = value
        }
    }
//    func callRequest() {
//        let url = "https://api.upbit.com/v1/market/all"
//        
//        AF.request(url).responseDecodable(of: [Market].self) { response in
//            switch response.result {
//            case .success(let success):
//                self.list = success
//                self.tableView.reloadData()
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.outputMarketData.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NetworkCell")!
        let data = viewModel.outputMarketData.value[indexPath.row]
        cell.textLabel?.text = data.korean_name
        cell.detailTextLabel?.text = data.market
        return cell
    }

  
}

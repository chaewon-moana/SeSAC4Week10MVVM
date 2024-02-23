//
//  userTableViewController.swift
//  SeSAC4Week10MVVM
//
//  Created by Greed on 2/22/24.
//

import UIKit
//뷰적인 모든 것들을 담당. UIKit O, 뷰모델 인스턴스만 갖고 있음
class userTableViewController: UITableViewController {
    
    let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Food(name: "pizza")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = viewModel.cellForRowAt(indexPath).name
        cell.detailTextLabel?.text = "\(viewModel.cellForRowAt(indexPath).age)"
        return cell
    }

}

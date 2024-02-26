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
    
    @IBOutlet var removeAllButton: UIBarButtonItem!
    @IBOutlet var fetchAllButton: UIBarButtonItem!
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var searchTextFeidl: UITextField!
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    func configureView() {
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    @objc func addButtonClicked() {
        //viewModel > list > append
        viewModel.appendUser(name: addTextField.text)
        tableView.reloadData()
        
        
        
    }
    @objc func searchButtonClicked() {
        print(#function)
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

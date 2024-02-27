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
        bindData()
        
    }
    
    func bindData() {
        viewModel.list.bind { user in //변경이 될 때마다, 변경을 해보아라! -> Observable 다시 학습하자,,ㅠㅠ
            self.tableView.reloadData()
        }
       //viewModel.fetchUser() //뷰컨에서 관리하기 싫다면은 뷰모델로 넘길 수 있음
    }
    
    func configureView() {
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        fetchAllButton.target = self
        fetchAllButton.action = #selector(fetchAllButtonClicked) //bar button item은 다 따로 구현되어있어서 action만 처리해주면 됨
        removeAllButton.target = self
        removeAllButton.action = #selector(fetchRemoveClicked)
    }
    @objc func fetchRemoveClicked() {//FetchUser()가 private으로 막혀있으므로 버튼이 클릭이 된 것을 넘긴다
        print(#function)
        viewModel.inputRemoveButtonClicked.value = ()
        
    }
    @objc func fetchAllButtonClicked() {
        print(#function)
        viewModel.inputFetchButtonClicked.value = ()
    }
    
    @objc func addButtonClicked() {
        //viewModel > list > append
        //viewModel.appendUser(name: addTextField.text)
        viewModel.inputAddText.value = addTextField.text
       // tableView.reloadData() //리스트가 변경이 됨! 리스트가 변경이 되면 bindData에서 reloadData를 해줌! 그래서 여기서 reloadData 안해줘도 됨
        
    }
    @objc func searchButtonClicked() {
        print(#function)
        viewModel.inputSearchWord.value = searchTextFeidl.text
        
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

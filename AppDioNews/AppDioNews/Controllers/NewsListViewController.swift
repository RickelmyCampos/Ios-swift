//
//  ViewController.swift
//  AppDioNews
//
//  Created by Mrpay on 15/03/24.
//

import UIKit

class NewsListViewController: UIViewController {
        
    @IBOutlet weak var newsListTableView: UITableView!
    private var newsList:[NewsModel]?{
        didSet{
            self.newsListTableView.reloadData()
        }
    }
    var dataProvider:NewsListDataProvider?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.initDataProvider()
    }
    private func initDataProvider(){
        self.dataProvider = NewsListDataProvider()
        self.dataProvider?.delegate = self
        self.dataProvider?.getNewsList()
    }
    func setupTableView(){
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
        self.newsListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
}
extension NewsListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
}
extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell",for:  indexPath)else{
            fatalError("Unable to dequeue subclassed cell")
        }
        return UITableViewCell()
    }
}
extension NewsListViewController:NewsListDataProviderProcotol{
    func success(model: Any) {
        self.newsList = model as? [NewsModel]
        self.newsListTableView.reloadData()
    }
    
    func errorData(_ provide: DataProviderProcotol?, error: Error) {
        print("error:\(error.localizedDescription)")
    }
}

//
//  HomeViewController.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import UIKit

class HomeViewController: UIViewController, HeaderViewDelegate {
    
    @IBOutlet weak var headerView: HeaderView!
    
    var headerLabel: UILabel?
    var headerImage: UIImage?
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ArticleModel(articles: [])
    var presenter = ArticlePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.delegate = self
        
        headerLabel?.text = "Home"
        headerImage = UIImage(named: "sampleImage") ?? nil
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.getArticles()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell()
        cell.articleTitle?.text = data[indexPath.row].title
        cell.articleHeading?.text = data[indexPath.row].heading
        return cell
    }
}

extension HomeViewController: ArticlePresenterOutput {
    
    func setArticles(bindViewModel: (ArticleModel) -> Void) {
        bindViewModel(model)
        tableView.reloadData()
    }
    
}

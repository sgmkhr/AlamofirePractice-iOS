//
//  ArticleModel.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation

class ArticleModel {
    var articles: [Article]
    init(articles: [Article]) {
        self.articles = articles
    }
    
    func updateUsers(result: [UserResponse]) {
        self.articles = result.map{
            return User(id: String($0.id), title: $0.title, heading: $0.heading, body: $0.body)
        }
    }
}

struct Article {
    var id: String
    var title: String
    var heading: String
    var body: String
    
    init(id: String, title: String, heading: String, body: String) {
        self.id = id
        self.title = title
        self.heading = heading
        self.body = body
    }
}

//
//  ArticleUseCase.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation
import PromiseKit

class ArticleUseCase {
    var articleDataSource = ArticleDataSource()
    weak var delegate: ArticleUseCaseOutput!
    
    func getArticles() {
        articleDataSource.getArticles().done { result in
            self.delegate.setArticles(result: result)
        }.catch { error in
            print(error)
        }
    }
}

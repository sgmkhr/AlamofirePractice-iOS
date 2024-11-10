//
//  ArticlePresenter.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation

class ArticlePresenter {
    var useCase = ArticleUseCase()
    weak var delegate: ArticlePresenterOutput!
    
    func getArticles() {
        useCase.delegate = self
        useCase.getArticles()
    }
}

extension ArticlePresenter: ArticleUseCaseOutput {
    func setArticles(result: [ArticleResponse]) {
        self.delegate?.setArticles { model in
            model.updateArticles(result: result)
        }
    }
}

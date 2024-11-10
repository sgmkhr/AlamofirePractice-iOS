//
//  ArticlePresenterOutput.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation

typealias BindViewModelBlock<T> = (_ model: T) -> Void

protocol ArticlePresenterOutput: AnyObject {
    func setArticles(bindViewModel: BindViewModelBlock<ArticleModel>)
}

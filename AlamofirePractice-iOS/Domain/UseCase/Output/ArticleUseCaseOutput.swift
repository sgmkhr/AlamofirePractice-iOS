//
//  ArticleUseCaseOutput.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation

protocol ArticleUseCaseOutput: AnyObject {
    func setArticles(result: [ArticleResponse])
}

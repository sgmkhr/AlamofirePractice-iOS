//
//  ArticleResponse.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation

struct ArticleResponse: Codable {
    let id: Int
    let title, heading, body: String
}

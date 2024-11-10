//
//  ArticleDataSource.swift
//  AlamofirePractice-iOS
//
//  Created by 菅原実希 on 2024/11/11.
//

import Foundation
import PromiseKit
import Alamofire

class ArticleDataSource {
    
    func getArticles() -> Promise<[ArticleResponse]> {
        let request = ArticlesRequest()
        return response(url: URL(string: request.url + request.port + request.path)!)
    }
    
    func response<Response: Codable>(url: URL, method: HTTPMethod = .get) -> Promise<Response> {
        return Promise<Response> { resolver in
          AF.request(url, method: method)
              .responseData{ response in
                  switch response.result {
                  case .success:
                      do {
                          let decoder = JSONDecoder()
                          guard let data = response.data else { return }
                          let result = try decoder.decode(Response.self, from: data)
                          resolver.fulfill(result)
                      } catch {
                          resolver.reject(error)
                      }
                  case .failure(let error):
                      resolver.reject(error)
                  }
              }
      }
    }
}

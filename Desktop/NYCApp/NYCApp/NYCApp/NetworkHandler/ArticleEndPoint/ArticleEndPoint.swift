//
//  ArticleEndPoint.swift
//  NYCApp
//
//  Created by Vivekvardhan Kasthuri on 02/07/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case base
    
}

public enum ArticleApi {
    case search
    case mostViewed
    case mostEmailed
    case mostShared
}

extension ArticleApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .base: return "https://api.nytimes.com/svc"
        
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/v2/articlesearch.json?q=election&api-key=i3pkAFwumrNR1OwGbMKCMNHYAc8b5AM6"
        case .mostEmailed:
            return "/mostpopular/v2/emailed/7.json?api-key=i3pkAFwumrNR1OwGbMKCMNHYAc8b5AM6"
        case .mostShared:
            return "/mostpopular/v2/shared/1/facebook.json?api-key=i3pkAFwumrNR1OwGbMKCMNHYAc8b5AM6"
        case .mostViewed:
            return "/mostpopular/v2/viewed/1.json?api-key=i3pkAFwumrNR1OwGbMKCMNHYAc8b5AM6"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .search:
            return .request
        case .mostEmailed:
            return .request
        case .mostViewed:
            return .request
        case .mostShared:
            return .request
        
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

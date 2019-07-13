//
//  JSONParser.swift
//  NYCApp
//
//  Created by Vivekvardhan Kasthuri on 02/07/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import Foundation


class   JSONparser  {
    
    var articles = [Article]()
    
     func parseJson (json: NSDictionary) ->[Article] {
        
        let response = json.value(forKey: "response") as! NSDictionary
        
        let docs = response.value(forKey: "docs") as! [NSDictionary]
        
        for i in 0...docs.count-1 {
            
            let doc  = docs[i]
            
            let headline = doc.value(forKey: "headline") as! NSDictionary
            
            var article = Article()
            
            article.title = (headline.value(forKey: "main") as! String)
            
            article.pub_date = (doc.value(forKey: "pub_date") as! String)
            
            articles.append(article)
            
        }
       return articles
    }
}

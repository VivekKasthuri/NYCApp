//
//  NetworkHandler.swift
//  NYCApp
//
//  Created by Vivekvardhan Kasthuri on 02/07/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import Foundation
import UIKit

class NetworkHandler {
     static let handler = NetworkHandler()
    
     let api_key = "i3pkAFwumrNR1OwGbMKCMNHYAc8b5AM6"

   
    
    func getSearchArticles(path: String, completion: @escaping (_ value: AnyObject,_ bool: Bool) -> Void) {
        
        guard let urlComponents = NSURLComponents(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json") else {
            return
        }
        
        let queryItems: [NSURLQueryItem] = [
            NSURLQueryItem(name: "q", value: path),
            NSURLQueryItem(name: "api-key", value: api_key)
        ]

        urlComponents.queryItems = queryItems as [URLQueryItem]
        
        guard let url = urlComponents.url else {
            return
        }
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let session = URLSession.shared
        let dataTask =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion("no data" as AnyObject,false)
            } else {
                do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                    completion(json as! NSDictionary,true)
                } catch {
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getMostViewedArticles( completion: @escaping (_ value: AnyObject,_ bool: Bool) -> Void) {
        
        guard let urlComponents = NSURLComponents(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json") else {
            return
        }
        
        let queryItems: [NSURLQueryItem] = [
            NSURLQueryItem(name: "api-key", value: api_key)
        ]
        
        urlComponents.queryItems = queryItems as [URLQueryItem]
        
        guard let url = urlComponents.url else {
            return
        }
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        let dataTask =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion("no data" as AnyObject,false)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    completion(json as! NSDictionary,true)
                } catch {
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
    
    
    func getMostSharedArticles( completion: @escaping (_ value: AnyObject,_ bool: Bool) -> Void) {
        
        guard let urlComponents = NSURLComponents(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json") else {
            return
        }
        
        let queryItems: [NSURLQueryItem] = [
            NSURLQueryItem(name: "api-key", value: api_key)
        ]
        
        urlComponents.queryItems = queryItems as [URLQueryItem]
        
        guard let url = urlComponents.url else {
            return
        }
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        let dataTask =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion("no data" as AnyObject,false)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    completion(json as! NSDictionary,true)
                } catch {
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getMostEmailedArticles( completion: @escaping (_ value: AnyObject,_ bool: Bool) -> Void) {
        
        guard let urlComponents = NSURLComponents(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json") else {
            return
        }
        
        let queryItems: [NSURLQueryItem] = [
            NSURLQueryItem(name: "api-key", value: api_key)
        ]
        
        urlComponents.queryItems = queryItems as [URLQueryItem]
        
        guard let url = urlComponents.url else {
            return
        }
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        let dataTask =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion("no data" as AnyObject,false)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    completion(json as! NSDictionary,true)
                } catch {
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
    
}
